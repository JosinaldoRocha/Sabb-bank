import '../../util/clean_screen.dart';
import '../../util/read.dart';
import '../../variables/caluladora_do_saldo.dart';
import '../../variables/pix.dart';
import '../../variables/transfer.dart';
import '../../variables/users.dart';
import 'menu_transfer.dart';

late double valueTransfer;
Map<String, dynamic> searchData = {};
late int optionAccount;
late int counter;
late int bank;
late int agency;
late int numberAccount;
late bool positiveExtract;

transfer() {
  int option = 0;
  if (optionMenuTransfer == 2) {
    bank = 0;
    while (bank < 1 || bank > banks.length) {
      counter = 1;
      print('Banco:');
      for (var element in banks) {
        print('[${counter++}] - $element');
      }
      bank = readInt();
    }

    agency = readInt(message: 'Agência:');
  } else {
    bank = 1;
    agency = currentUser["agencia"];
  }

  positiveTransfer();
do {
    option = readInt(message: '[1] Voltar ao menu de transferências');
  } while (option != 1);
  transferMenu();
}

void positiveTransfer() {
  numberAccount = readInt(message: 'Número da conta:');

  if (users.any((element) => element["conta"] == numberAccount)) {
    int digit = readInt(message: 'Dígito:');

    bool positiveAccount = users.any((element) =>
        element["conta"] == numberAccount &&
        element["nome"] == currentUser["nome"]);

    if (!positiveAccount) {
      valueTransfer = readDouble(message: 'Valor a transferir:');

      if (valueTransfer <= balanceUSer[currentUser["nome"]]) {
        optionAccount = 0;
        while (optionAccount < 1 || optionAccount > account.length) {
          counter = 1;
          print('Debitar da conta:');
          for (var element in account) {
            print('[${counter++}] - $element');
          }
          optionAccount = readInt();
        }

        searchData =
            users.firstWhere((element) => element["conta"] == numberAccount);

        print(
            '\nConfira os dados e digite sua senha para confirmar a transferência.\n');
        print(
            '<<Destino>>\nNome: ${searchData["nome"]} ${searchData["sobrenome"]}\nBanco: ${banks[bank - 1]}'
            '\nAgência: $agency\nNúmero da conta: $numberAccount\nDígito: $digit\n');

        String password = "Senha inválida";

        while (password == "Senha inválida") {
          password = readString(message: 'Senha:');
          if (users.any((element) =>
              element["senha"] == password &&
              element["nome"] == currentUser["nome"])) {
            cleanScreen();
            confirmTransfer();
          } else {
            cleanScreen();
            password = "Senha inválida";
            print('\n$password, tente novamente!');
            cleanScreen();
          }
        }
      } else {
        print('\nSaldo insuficiente!\n');
      }
    } else {
      print('\nVocê não pode transferir para sua própria conta.\n');
    }
  } else {
    print('\nConta inexistente!\n');
  }
}

void confirmTransfer() {
  dataTransfer = {};

  if (balanceUSer[searchData["nome"]] == null) {
    balanceUSer[searchData["nome"]] = valueTransfer;
  } else {
    balanceUSer[searchData["nome"]] += valueTransfer;
  }

  balanceUSer[currentUser["nome"]] -= valueTransfer;

  print('\nTransferência concluída!');

  extractTransfer();

  positiveExtract = showAllExtractTransfer.any((element) =>
      element["nome"] == currentUser["nome"] ||
      element["meu_nome"] == currentUser["nome"]);

  if (positiveExtract) {
    if (allExtractTransfer[currentUser["nome"]] == null) {
      allExtractTransfer[currentUser["nome"]] = dataExtractTransfer;
    } else {
      allExtractTransfer[currentUser["nome"]] += dataExtractTransfer;
    }
    if (allExtractTransfer[searchData["nome"]] == null) {
      allExtractTransfer[searchData["nome"]] = dataExtractTransfer;
    } else {
      allExtractTransfer[searchData["nome"]] += dataExtractTransfer;
    }
  }

  dataExtractTransfer = [];

  int option = readInt(message: '[1] Ver comprovante      [2] Ir para extrato');
  cleanScreen();
  if (option == 1) {
    proofTransfer();
  } else if (option == 2) {
    showExtractTransfer();
  } else {
    print('\nOpção inválida!\n');
  }
}

void extractTransfer() {
  dataTransfer["valor"] = valueTransfer;
  dataTransfer["nome"] = searchData["nome"];
  dataTransfer["sobrenome"] = searchData["sobrenome"];
  dataTransfer["agencia_destino"] = agency;
  dataTransfer["conta_destino"] = numberAccount;
  dataTransfer["cpf"] = searchData["cpf"];
  dataTransfer["meu_nome"] = currentUser["nome"];
  dataTransfer["agencia"] = currentUser["agencia"];
  dataTransfer["conta"] = account[optionAccount - 1];
  dataTransfer["minha_conta"] = currentUser["conta"];

  showAllExtractTransfer.add(dataTransfer);
  dataExtractTransfer.add(dataTransfer);
}

void showExtractTransfer() {
  if (allExtractTransfer[currentUser["nome"]] == null) {
    print('Nenhuma transferência realizada!');
  } else {
    print('\n------------------------------------------------');
    for (var element in allExtractTransfer[currentUser["nome"]]) {
      print('Tipo de transferência: TED');
      print('Valor da transferência: R\$${element["valor"]}\n');
      print('<<Destino>>');
      print('Nome: ${element["nome"]} ${element["sobrenome"]}');
      print('Agência: ${element["agencia_destino"]}');
      print('Conta: ${element["conta_destino"]}');
      print('CPF: ${element["cpf"]}');
      print('<<Origem>>');
      print('Nome: ${element["meu_nome"]}');
      print('Agência: ${element["agencia"]}');
      print('Conta: ${element["conta"]}');
      print('Número da conta: ${element["minha_conta"]}');
      print('------------------------------------------------\n');
    }
  }
}

void proofTransfer() {
  print('\nComprovante de transferência\n'
      'Valor da transferência: R\$ $valueTransfer\nTipo de transferência: TED\n');
  print('Destino:');
  print(
      'Instituição: ${banks[bank - 1]}\nAgência: $agency \nNúmero da conta: $numberAccount\n'
      'Nome: ${searchData["nome"]} ${searchData["sobrenome"]}\n'
      'CPF: ${searchData["cpf"]}\n');

  print('Origem:');
  print('Nome: ${currentUser["nome"]} ${currentUser["sobrenome"]}\n'
      'Instituição: Sabb bank\nAgência: ${currentUser["agencia"]}\n'
      'Conta: ${account[optionAccount - 1]}\n'
      'Número da conta: ${currentUser["conta"]}\n');
}

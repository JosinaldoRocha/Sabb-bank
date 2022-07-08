import '../../util/clean_screen.dart';
import '../../util/read.dart';
import '../../variables/caluladora_do_saldo.dart';
import '../../variables/pix.dart';
import '../../variables/users.dart';
import 'pix_area.dart';
import 'register_new_key.dart';

late double valueTransferPix;
late String keyTransfer;
late Map<String, dynamic> searchUSer;
late Map<String, dynamic> searchLastName;
late bool positiveExtractPix;

late int accountType;
late int counter;
int option = 0;

void transferPix() {
  counter = 1;
  for (var element in typeKey) {
    print('[${counter++}] $element');
  }
  type = readInt(message: 'Tipo de chave pix:');

  if (type > 0 && type <= typeKey.length) {
    positiveTransferPix();
  } else {
    print('\nOpção inválida!');
  }

  do {
    option = readInt(message: '[1] Voltar ao menu pix');
  } while (option != 1);
  pixMenuTwo();
}

void positiveTransferPix() {
  accountType = 0;

  keyTransfer = readString(message: 'Chave:');

  bool negativeKey = users.any((element) =>
      element["chave"] == keyTransfer &&
      element["nome"] == currentUser["nome"]);

  if (!negativeKey) {
    bool positiveKey = users.any((element) =>
        element["chave"] == keyTransfer &&
        element["tipo"] == typeKey[type - 1]);

    if (positiveKey) {
      while (accountType != 1 && accountType != 2) {
        currentSavings();
      }

      valueTransferPix = readDouble(message: 'Valor da transferência:');

      if (valueTransferPix <= balanceUSer[currentUser["nome"]]) {
        search();
        print(
            '\nConfirme os dados de destino e digite sua senha para confirmar a transferência.');
        print(
            '\nTipo de chave pix: ${typeKey[type - 1]}\nChave pix: $keyTransfer\n'
            'Nome: ${searchLastName["nome"]} ${searchLastName["sobrenome"]}\n'); //beneficiado

        String password = "Senha inválida";

        while (password == "Senha inválida") {
          password = readString(message: 'Senha:');
          if (users.any((element) =>
              element["senha"] == password &&
              element["nome"] == currentUser["nome"])) {
            cleanScreen();
            confirmTransferPix();
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
      print('\nChave inexistente!\n');
    }
  } else {
    print('Você não pode transferir para uma chave pix sua.');
  }
}

void search() {
  searchUSer = users.firstWhere((element) => element["chave"] == keyTransfer);

  searchLastName =
      users.firstWhere((element) => element["nome"] == searchUSer["nome"]);
}

void proof() {
  print('\nComprovante de transferência\n'
      'Valor da transferência: R\$ $valueTransferPix\nTipo de transferência: Pix\n');
  print('Destino:');
  print('Tipo de chave pix: ${typeKey[type - 1]}\nChave pix: $keyTransfer\n'
      'Nome: ${searchLastName["nome"]} ${searchLastName["sobrenome"]}\n'
      'CPF: ${searchLastName["cpf"]}\n');

  print('Origem:');
  print('Nome: ${currentUser["nome"]} ${currentUser["sobrenome"]}\n'
      'Instituição: Sabb bank\nAgência: ${currentUser["agencia"]}\n'
      'Conta: ${account[accountType - 1]}\n'
      'Número da conta ${account[accountType - 1]}: ${currentUser["conta"]}\n');
}

void currentSavings() {
  counter = 1;
  accountType = 0;
  while (accountType != 1 && accountType != 2) {
    print('Debitar da sua conta:');
    for (var element in account) {
      print('[${counter++}] $element');
    }
    accountType = readInt(message: 'Conta:');
  }
}

void confirmTransferPix() {
  dataTransferPix = {};

  balanceUSer[searchUSer["nome"]] +=
      valueTransferPix; // adição no saldo do beneficiado

  balanceUSer[currentUser["nome"]] -=
      valueTransferPix; //subtração no saldo do pagador

  print('\nTransferência concluída!');

  extractPix();

  positiveExtractPix = showAllExtractPix.any((element) =>
      element["nome"] == currentUser["nome"] ||
      element["meunome"] == currentUser["nome"]);

  if (positiveExtractPix) {
    if (allExtract[currentUser["nome"]] == null) {
      allExtract[currentUser["nome"]] = dataExtract;
    } else {
      allExtract[currentUser["nome"]] += dataExtract;
    }
    if (allExtract[searchLastName["nome"]] == null) {
      allExtract[searchLastName["nome"]] = dataExtract;
    } else {
      allExtract[searchLastName["nome"]] += dataExtract;
    }
  }

  dataExtract = [];

  option = readInt(message: '[1] Ver comprovante      [2] Ir para extrato pix');
  cleanScreen();
  if (option == 1) {
    proof();
  } else if (option == 2) {
    showExtractPix();
  } else {
    print('\nOpção inválida!\n');
  }
}

void extractPix() {
  dataTransferPix["valor"] = valueTransferPix;
  dataTransferPix["tipo"] = typeKey[type - 1];
  dataTransferPix["chave"] = keyTransfer;
  dataTransferPix["nome"] = searchLastName["nome"];
  dataTransferPix["sobrenome"] = searchLastName["sobrenome"];
  dataTransferPix["cpf"] = searchLastName["cpf"];
  dataTransferPix["meunome"] = currentUser["nome"];
  dataTransferPix["agencia"] = currentUser["agencia"];
  dataTransferPix["conta"] = account[accountType - 1];
  dataTransferPix["numerodaconta"] = currentUser["conta"];

  showAllExtractPix.add(dataTransferPix);
  dataExtract.add(dataTransferPix);
}

void showExtractPix() {
  if (allExtract[currentUser["nome"]] == null) {
    print('Nenhuma transferência pix realizada!');
  } else {
    print('------------------------------------------------');
    for (var element in allExtract[currentUser["nome"]]) {
      print('Tipo de transferência: Pix');
      print('Valor da transferência: R\$${element["valor"]}\n');
      print('<<Destino>>');
      print('Nome: ${element["nome"]} ${element["sobrenome"]}');
      print('Tipo de chave: ${element["tipo"]}');
      print('Chave: ${element["chave"]}');
      print('CPF: ${element["cpf"]}');
      print('<<Origem>>');
      print('Nome: ${element["meunome"]}');
      print('Agência: ${element["agencia"]}');
      print('Conta: ${element["conta"]}');
      print('Número da conta: ${element["numerodaconta"]}');
      print('------------------------------------------------\n');
    }
  }
}

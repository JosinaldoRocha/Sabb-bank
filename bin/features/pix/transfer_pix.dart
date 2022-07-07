import '../../util/clean_screen.dart';
import '../../util/read.dart';
import '../../variables/caluladora_do_saldo.dart';
import '../../variables/pix.dart';
import '../../variables/users.dart';
import 'pix_area.dart';
import 'register_new_key.dart';

late double valueTransfer;
late String keyTransfer;
late Map<String, dynamic> searchUSer;
late Map<String, dynamic> searchLastName;
late Map<String, dynamic> searchExtractPix;
late bool testExtract;

late int accountType;
late int counter;
int option = 0;
void transferPix() {
  type = 0;

  while (type < 1 || type > typeKey.length) {
    print('Qual tipo de chave pix receberá a transferência?');
    counter = 1;
    for (var element in typeKey) {
      print('[${counter++}] $element');
    }
    type = readInt(message: 'Tipo de chave:');

    if (type > 0 && type <= typeKey.length) {
      transferPositive();
    } else {
      print('\nOpção inválida!');
    }
  }

  do {
    option = readInt(message: '[1] Voltar ao menu pix');
  } while (option != 1);
  pixMenuTwo();
}

void transferPositive() {
  accountType = 0;

  keyTransfer = readString(message: 'Chave:');

  while (accountType != 1 && accountType != 2) {
    currentSavings();
  }
  bool positiveTransfer = users.any((element) =>
      element["chave"] == keyTransfer && element["tipo"] == typeKey[type - 1]);

  if (positiveTransfer) {
    search();

    do {
      print(
          '\nDestino:\nTipo de chave pix: ${typeKey[type - 1]}\nChave pix: $keyTransfer\n'
          'Nome: ${searchLastName["nome"]} ${searchLastName["sobrenome"]}\n'); //beneficiado

      valueTransfer = readDouble(message: 'Valor da transferência:');

      option = readInt(message: '[1] Confirmar');
      cleanScreen();
    } while (option != 1);
    confirmTransfer();
  } else {
    print('Chave inexistente!\n');
  }
}

void search() {
  searchUSer = users.firstWhere((element) => element["chave"] == keyTransfer);

  searchLastName =
      users.firstWhere((element) => element["nome"] == searchUSer["nome"]);
}

void proof() {
  print('\nComprovante de transferência\n'
      'Valor da transferência: R\$ $valueTransfer\nTipo de transferência: Pix\n');
  print('Destino:');
  print('Tipo de chave pix: ${typeKey[type - 1]}\nChave pix: $keyTransfer\n'
      'Nome: ${searchLastName["nome"]} ${searchLastName["sobrenome"]}\n'
      'CPF: ${searchLastName["cpf"]}\n');

  print('Origem:');
  print('Nome: ${currentUser["nome"]} ${currentUser["sobrenome"]}\n'
      'Instituição: Sabb bank\nAgência: ${currentUser["agencia"]}\n'
      'Conta: ${account[accountType - 1]}\n'
      'Número da conta ${account[accountType - 1]}: ${currentUser["conta"]}\n');

  //teste
  print(
      'Saldo do beneficiado: ${balanceUSer[searchUSer["nome"]]}'); //beneficiado
  print('Meu saldo: ${balanceUSer[currentUser["nome"]]}\n'); //pagador
}

void currentSavings() {
  counter = 1;
  print('Debitar da sua conta:');
  for (var element in account) {
    print('[${counter++}] $element');
  }
  accountType = readInt(message: 'Conta:');
}

void confirmTransfer() {
  dataTransfer = {};
  if (valueTransfer <= balanceUSer[currentUser["nome"]]) {
    balanceUSer[searchUSer["nome"]] +=
        valueTransfer; // adição no saldo do beneficiado

    balanceUSer[currentUser["nome"]] -=
        valueTransfer; //subtração no saldo do pagador

    print('\nTransferência concluída!');

    extractPix();

    testExtract = showAllExtractPix.any((element) =>
        element["nome"] == currentUser["nome"] ||
        element["meunome"] == currentUser["nome"]);

    if (testExtract) {
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

    option = readInt(
        message:
            '[1] Ver comprovante      [2] Ir para extrato pix\n[3] Voltar para a área pix');
    cleanScreen();
    if (option == 1) {
      proof();
    } else if (option == 2) {
      showExtractPix();
    } else if (option == 3) {
      pixMenuTwo();
    } else {
      print('\nOpção inválida!\n');
      do {
        option = readInt(message: '[1] Voltar para a área pix');
        cleanScreen();
      } while (option != 1);
      pixMenuTwo();
    }
  } else {
    print('Saldo insuficiente!');
  }
}

void extractPix() {
  dataTransfer["valor"] = valueTransfer;
  dataTransfer["tipo"] = typeKey[type - 1];
  dataTransfer["chave"] = keyTransfer;
  dataTransfer["nome"] = searchLastName["nome"];
  dataTransfer["sobrenome"] = searchLastName["sobrenome"];
  dataTransfer["cpf"] = searchLastName["cpf"];
  dataTransfer["meunome"] = currentUser["nome"];
  dataTransfer["agencia"] = currentUser["agencia"];
  dataTransfer["conta"] = account[accountType - 1];
  dataTransfer["numerodaconta"] = currentUser["conta"];

  showAllExtractPix.add(dataTransfer);
  dataExtract.add(dataTransfer);
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

import '../../util/read.dart';
import '../../variables/caluladora_do_saldo.dart';
import '../../variables/pix.dart';
import '../../variables/users.dart';
import '../authentication/step3.dart';
import 'pix_area.dart';
import 'register_new_key.dart';

late double valueTransfer;
late String keyTransfer;
late Map<String, dynamic> searchUSer;
late Map<String, dynamic> searchLastName;
late Map<String, dynamic> searchBalance;

late int accountType;
int counter = 1;
int option = 0;
void transferPix() {
  type = 0;

  while (type < 1 || type > typeKey.length) {
    print('Qual tipo de chave pix receberá a transferência?');

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
    counter = 1;
    print('Debitar da sua conta:');
    for (var element in account) {
      print('[${counter++}] $element');
    }
    accountType = readInt(message: 'Conta:');
  }

  bool positiveTransfer = users.any((element) =>
      element["chave"] == keyTransfer && element["tipo"] == typeKey[type - 1]);

  if (positiveTransfer) {
    search();
    do {
      valueTransfer = readDouble(message: 'Valor da transferência:');

      print(
          '\nDestino:\nTipo de chave pix: ${typeKey[type - 1]}\nChave pix: $keyTransfer\n'
          'Nome: ${searchLastName["nome"]} ${searchLastName["sobrenome"]}\n'); //beneficiado

      option = readInt(message: '[1] Confirmar transferência');
    } while (option != 1);

    if (valueTransfer <= balanceUSer[currentUser["nome"]]) {
      searchBalance[searchUSer["usuário"]] +=
          valueTransfer; // adição no saldo do beneficiado

      balanceUSer[currentUser["nome"]] -=
          valueTransfer; //subtração no saldo do pagador

      print('\nTransferência concluída!');
      searchUSer["saldo"] += valueTransfer;
      user["saldo"] -= valueTransfer;

      option = readInt(
          message: '[1] Ver comprovante      [2] Voltar para a área pix');
      if (option == 1) {
        proof();
      } else if (option == 2) {
        pixMenuTwo();
      } else {
        print('\nOpção inválida!\n');
        do {
          option = readInt(message: '[1] Voltar ao menu inicial');
        } while (option != 1);
      }
    } else {
      print('Saldo insuficiente!');
    }
  } else {
    print('Chave inexistente!\n');
  }
}

void search() {
  searchUSer = users.firstWhere((element) => element["chave"] == keyTransfer);

  searchLastName =
      users.firstWhere((element) => element["nome"] == searchUSer["usuário"]);

  searchBalance = users.firstWhere(
      (element) => element[searchUSer["usuário"]] == searchUSer["saldo"]);
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

  print(
      'Saldo do beneficiado: ${searchBalance[searchUSer["usuário"]]}'); //beneficiado
  print('Meu saldo: ${balanceUSer[currentUser["nome"]]}\n'); //pagador
}

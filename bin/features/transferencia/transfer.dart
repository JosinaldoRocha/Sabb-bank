import '../../util/read.dart';
import '../../variables/pix.dart';
import '../../variables/transfer.dart';
import '../../variables/users.dart';
import '../emprestimo/make_a_loan.dart';
import 'menu_transfer.dart';

transfer() {
  late int counter;
  late int bank;
  late int agency;
  if (optionMenuTransfer == 2) {
    bank = 0;
    while (bank < 1 || bank > banks.length) {
      counter = 1;
      print('Banco:');
      for (var element in banks) {
        print('[${counter++}] - $element');
      }
      bank = readInt();
      print(banks[bank - 1]);

      print('Agência');
      agency = readInt();
      print(agency);
    }
  } else {
    bank = 1;
    //agency = currentUser["agencia"];
    agency = 2345;
  }

  print(banks[bank - 1]);
  counter = 1;
  print('Tipo de conta:');
  for (var element in account) {
    print('[${counter++}] - $element');
  }
  int optionAccount = readInt();
  print(account[optionAccount - 1]);

  print('Número da conta ${account[optionAccount - 1]}:');
  int numberAccount = readInt();
  print(numberAccount);

  double valueTransfer = readDouble(message: 'Valor a transferir:');
  print(valueTransfer);

  print('\nConfira os dados e digite sua senha para confirmar a transferência.\n');
  print('Destino\nNome: \nBanco: ${banks[bank - 1]}\nAgência: $agency\n'
      'Tipo de conta: ${account[optionAccount - 1]}\nNúmero da conta: $numberAccount\n');
  int password = readInt(message: 'Senha:');
  //bool positivePassword = users.any......

  // bool welTrasfer = registerTrasfer.any((element) =>
  //     element["banco"] == bank &&
  //     element["nome"] == name &&
  //     element["agencia"] == agency &&
  //     element["conta"] == count &&
  //     element["digito"] == digit &&
  //     element["senha"] == password);

  // if (welTrasfer) {
  //   print("traferencia aceita");
  // } else {
  //   print("trasferencia negada");
  //   tedTrasfer();
  // }
}

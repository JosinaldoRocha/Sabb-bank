import '../../util/read.dart';
import 'transfer.dart';
//import '../home/Home.dart';

List<Map<String, dynamic>> myAccount = [
  {
    "Nome": "Gabriel",
    "Saldo": 1.500,
  }
];

List<Map<String, dynamic>> registerTrasfer = [
  {
    "banco": "Brasil",
    "nome": "Gabriel",
    "agencia": 2345,
    "conta": 12345678,
    "digito": 3,
    "senha": 123456,
  }
];
late int optionMenuTransfer;
void main() {
  int option = 1;
  while (option == 1) {
    print('Bem vindo à área de transferências!\n');

    optionMenuTransfer = readInt(
        message:
            '[1] Contas Sabb Bank          [2] Outros bancos\n[3] Voltar ao menu inicial');

    if (option == 1) {
      transfer();
    } else if (option == 2) {
      transfer();
    } else if (option == 3) {
    } else {
      print('Opção inválida');
    }
    option = readInt(
        message: '[1] Nova transferência    [2] Voltar ao meno inicial');
  }
  //home();
  print("Show");
}

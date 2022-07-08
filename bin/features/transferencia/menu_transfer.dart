import '../../util/read.dart';
import '../home/Home.dart';
import 'transfer.dart';

late int optionMenuTransfer;

void transferMenu() {
  int option = 1;
  while (option == 1) {
    print('Bem vindo à área de transferências!\n');

    optionMenuTransfer = readInt(
        message: '[1] Contas Sabb Bank            [2] Outros bancos\n'
            '[3] Extrato de trasnferência    [4] Voltar ao menu inicial');

    if (option == 1) {
      transfer();
    } else if (option == 2) {
      transfer();
    } else if (option == 3) {
      extractTransfer();
      int option = 0;
      do {
        option = readInt(message: '[1] Voltar');
      } while (option != 1);
      transferMenu();
    } else if (option == 4) {
      home();
    } else {
      print('Opção inválida');
    }
    option = readInt(
        message: '[1] Nova transferência    [2] Voltar ao meno inicial');
  }
  home();
}

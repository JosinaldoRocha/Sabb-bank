import '../../util/read.dart';
import '../home/Home.dart';
import 'transfer.dart';

late int optionMenuTransfer;
late int optionTransfer;

void transferMenu() {
  optionMenuTransfer = 0;
  while (optionMenuTransfer < 1 || optionMenuTransfer > 4) {
    print('Bem vindo à área de transferências!\n');

    optionMenuTransfer = readInt(
        message: '[1] Contas Sabb Bank            [2] Outros bancos\n'
            '[3] Extrato de trasnferência    [4] Voltar ao menu inicial');

    if (optionMenuTransfer == 1) {
      transfer();
    } else if (optionMenuTransfer == 2) {
      transfer();
    } else if (optionMenuTransfer == 3) {
      showExtractTransfer();
      optionTransfer = 0;
      do {
        optionTransfer = readInt(message: '[1] Voltar');
      } while (optionTransfer != 1);
      transferMenu();
    } else if (optionMenuTransfer == 4) {
      home();
    } else {
      print('Opção inválida');
    }
  }
}

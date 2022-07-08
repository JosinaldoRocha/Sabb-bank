import '../../util/clean_screen.dart';
import '../../util/read.dart';
import '../../variables/pix.dart';
import '../../variables/users.dart';
import '../home/Home.dart';
import 'my_keys_registered.dart';
import 'register_new_key.dart';
import 'transfer_pix.dart';

void pixArea() {
  if (myKeys[currentUser["nome"]] != null) {
    pixMenuTwo();
  } else {
    pixMenuOne();
  }
}

void pixMenuOne() {
  int option = 0;

  print(
      '\n<<Bem vindo à área pix, ${currentUser["nome"]}!>>\nVocê ainda não possue chave pix cadastrada.\n');

  while (option != 1 && option != 2) {
    print('[1] Cadastrar nova chave pix     [2] Voltar ao menu inicial');
    option = readInt(message: 'Digite uma opção:');
    cleanScreen();

    if (option == 1) {
      registerNewKey();
    } else if (option == 2) {
      home();
    }
  }
}

void pixMenuTwo() {
  print('\n           <<Bem vindo à área pix!>>');
  print('[1] Nova chave pix            [2] Minhas chaves pix\n'
      '[3] Pagar com pix             [4] Ir para extrato pix\n[5] Voltar ao menu inicial');
  int option = readInt(message: 'Digite um opção:');
  cleanScreen();

  if (option == 1) {
    registerNewKey();
  } else if (option == 2) {
    myKeysRegistered();
    print('');
  } else if (option == 3) {
    transferPix();
  } else if (option == 4) {
    showExtractPix();
    int option = 0;
    do {
      option = readInt(message: '[1] Voltar');
    } while (option != 1);
    pixMenuTwo();
  } else if (option == 5) {
    home();
  } else {
    print('\nOpção inválida!');
    do {
      option = readInt(message: '[1] Voltar ao menu inicial');
      cleanScreen();
    } while (option != 1);
    home();
  }
}

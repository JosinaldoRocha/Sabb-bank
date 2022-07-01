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
      '\nBem vindo à área pix, ${currentUser["nome"]}! Você ainda não possue chave pix cadastrada.\n');

  while (option != 1 && option != 2) {
    print('[1] Cadastrar nova chave pix     [2] Voltar ao menu inicial');
    option = readInt(message: 'Digite uma opção:');
    if (option == 1 || option == 01) {
      registerNewKey();
    } else if (option == 2 || option == 02) {
      home();
    }
  }
}

void pixMenuTwo() {

  print(
      '\n           <<Bem vindo à área pix!>>');
  print('[1] Nova chave pix            [2] Minhas chaves pix\n'
      '[3] Pagar com pix             [4] Voltar ao menu inicial');
  int option = readInt(message: 'Digite um opção:');

  if (option == 1) {
    registerNewKey();    
  } else if (option == 2) {
    myKeysRegistered();
    print('');
  } else if (option == 3) {
    transferPix();
  } else if (option == 4) {
    home();
  } else {
    print('\nOpção inválida!');
    do {
      option = readInt(message: '[1] Voltar ao menu inicial');
    } while (option != 1);
    home();
  }
}

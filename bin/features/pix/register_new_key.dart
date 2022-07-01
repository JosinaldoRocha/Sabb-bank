import '../../util/read.dart';
import '../../variables/pix.dart';
import '../../variables/users.dart';
import '../authentication/step3.dart';
import 'keys_verification.dart';
import 'pix_area.dart';

late String newKey;
late int type;

void registerNewKey() {
  user = {};
  int counter = 1;
  int option = 0;

  print('${currentUser["nome"]}, escolha o tipo para a nova chave pix.');
  for (var element in typeKey) {
    print('${counter++} - $element');
  }
  type = readInt(message: "Tipo de chave:");
  if (type > 0 && type <= typeKey.length) {
    keysVerification();
  } else {
    print('\nOpção inválida! :(\n');
  }

  if (myKeys[currentUser["nome"]] == null) {
    myKeys[currentUser["nome"]] = keysOneUSer;
  } else {
    myKeys[currentUser["nome"]] += keysOneUSer;
  }
  users.add(user);
  keysOneUSer = [];

  do {
    option = readInt(message: '[1] Voltar à área pix');
  } while (option != 1);
  pixMenuTwo();
}

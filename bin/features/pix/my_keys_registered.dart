import '../../util/read.dart';
import '../../variables/pix.dart';
import '../../variables/users.dart';
import 'pix_area.dart';

void myKeysRegistered() {
  int option;
  print('  << Chaves de ${currentUser["nome"]} >>');
  print(' ------------------------');
  for (var element in myKeys[currentUser["nome"]]) {
    print('|Tipo de chave: ${element["tipo"]}');
    print('|Chave: ${element["chave"]}');
    print(' ------------------------');
  }
  print('');
  do {
    option = readInt(message: '[1] Voltar à área pix');
  } while (option != 1);
  pixMenuTwo();
}

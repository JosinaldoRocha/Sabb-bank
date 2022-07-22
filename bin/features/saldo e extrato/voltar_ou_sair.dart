import '../../util/read.dart';
import '../home/home.dart';
import '../saldo e extrato/extrato.dart';

void voltarOuSair() {
  int option = readInt(message: '[1] voltar ao menu inicial');
  if (option == 1) {
    home();
  } else {
    mostrarExtrato();
  }
}

import '../../util/read.dart';
import '../home/Home.dart';
import '../saldo e extrato/extrato.dart';

void voltarOuSair() {
  print("1-voltar ao menu inicial\n");
  int option = readInt(message: "Escolha uma das opções acima: ");
  if (option == 1) {
    home();
  } else {
    mostrarExtrato();
  }
}
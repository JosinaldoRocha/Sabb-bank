import '../../util/read.dart';

void welcome() {
  print("-----------------------------------------------------------");
  print("                 Bem vindo a conta                        ");
  print("-----------------------------------------------------------");

  print("Escolha a sua opção desejada: ");

  print("(1). Dinheiro");
  print("(2). Cheque");

  int depos = readInt(message: "Qual o numero que voce quer depositar:? ");

  if (depos == 1) {
    print("Dinheiro");
  }
  if (depos == 2) {
    print("Cheque");
  }
  print("-----------------------------------------------------------");
}

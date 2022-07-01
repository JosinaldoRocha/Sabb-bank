import '../../util/read.dart';

goodDeposit() {
  print("Escolha a conta para o deposito: ");

  print("(1). Conta Corrente");
  print("(2). Conta Poupança");

  int opition = readInt(
      message: "Qual tipo de conta voce quer depositar o seu dinheiro?: ");

  switch (opition) {
    case 1:
      print("Conta Corrente");
      break;
    case 2:
      print("Conta Poupança");
      break;
    default:
      print("Conta invalida");
  }

  print("-----------------------------------------------------------");
}

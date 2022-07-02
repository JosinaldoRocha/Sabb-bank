import '../../util/read.dart';
import '../../variables/caluladora_do_saldo.dart';
import '../../variables/users.dart';
import '../home/Home.dart';

Map<String, dynamic> valor = {};
Future<void> newdeposit() async {
  int answer = 0;
  do {
    welcome();
    accountForDeposit();
    valor = {};
    double value = readDouble(message: "Digite o Valor do Deposito:? ");

    print("Carregando.......... espere alguns segundos................");

    await Future.delayed(Duration(seconds: 3));

    print("Você depositou: R\$$value.");

    balanceUSer[currentUser["nome"]] += value;
    balance = balanceUSer[currentUser["nome"]];

    valor["valor"] = value;

    allDeposits.add(valor);
    money1.add(valor);
    print("-----------------------------------------------------------");

    if (deposit[currentUser["nome"]] == null) {
      deposit[currentUser["nome"]] = allDeposits;
    } else {
      deposit[currentUser["nome"]] += allDeposits;
    }

    allDeposits = [];
    answer =
        readInt(message: '[1] Novo depósito      [2] Voltar ao menu principal');
  } while (answer == 1);
  home();
}

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

accountForDeposit() {
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

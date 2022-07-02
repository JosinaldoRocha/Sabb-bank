import '../../util/clean_screen.dart';
import '../../util/read.dart';
import '../../variables/caluladora_do_saldo.dart';
import '../../variables/users.dart';
import '../authentication/step2.dart';
import '../deposito/new_deposit.dart';
import '../emprestimo/init.dart';
import '../pix/pix_area.dart';
import '../saldo e extrato/extrato.dart';

late double balance;
void home() {
  print("-------------------------------------------------------");
  print("---------    Bem vindo ao Sabb Bank      --------------");
  print("-------------------------------------------------------");

  showBalance();
  print("Menu:");

  print("(1). Pix");
  print("(2). Depósito");
  print("(3). Emprestimo");
  print("(4). Trasferências");
  print("(5). Saldo e extrato");
  print("(6). Sair da conta");

  int opition = readInt(message: "Qual opção voçe deseja?");

  cleanScreen();
  switch (opition) {
    case 1:
      pixArea();
      break;
    case 2:
      newdeposit();
      break;
    case 3:
      init();
      break;
    case 4:
      // transferencias
      break;
    case 5:
      mostrarExtrato();
      break;
    case 6:
      step2();
      break;
    default:
      home();
  }
}

void showBalance() {
  users.add(balanceUSer);
  if (balanceUSer[currentUser["nome"]] == null) {
    balance = 0;
    balanceUSer[currentUser["nome"]] = balance;
    print('Saldo ${currentUser["nome"]}: R\$ $balance');
  } else {
    double showBalance = balanceUSer[currentUser["nome"]];
    print(
        'Saldo ${currentUser["nome"]}: R\$ ${showBalance.toStringAsFixed(2)}');
  }
}

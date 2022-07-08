import '../../variables/users.dart';
import '../emprestimo/make_a_loan.dart';
import '../home/Home.dart';
import '../pix/transfer_pix.dart';
import '../saldo e extrato/voltar_ou_sair.dart';
import '../../util/linha.dart';
import '../../variables/caluladora_do_saldo.dart';
import '../transferencia/transfer.dart';

void mostrarExtrato() {
  print("|=============| Extrato |===========|");

  if (deposit[currentUser["nome"]] == null) {
    print('Nenhum depósito realizado!');
  } else {
    print("Depositos:");
    for (var element in deposit[currentUser["nome"]]) {
      print(element["valor"]);
    }
    print('');
  }
  print("Empréstimos:");
  loanExtract();

  showExtractPix();

  showExtractTransfer();

  linha();
  showBalance();
  linha();
  voltarOuSair();
}

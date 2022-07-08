import '../../variables/pix.dart';
import '../../variables/users.dart';
import '../home/Home.dart';
import '../pix/transfer_pix.dart';
import '../saldo e extrato/voltar_ou_sair.dart';
import '../../util/linha.dart';
import '../../variables/caluladora_do_saldo.dart';
import '../transferencia/transfer.dart';

void mostrarExtrato() {
  print("|=============| Extrato |===========|");

  //area de deposito

  print("Depositos:");
  if (deposit[currentUser["nome"]] == null) {
    print('Nenhum depósito realizado!');
  } else {
    for (var element in deposit[currentUser["nome"]]) {
      print(element["valor"]);
    }
    print('');
  }
  //area de emprestimo
  Map<String, dynamic> emprestimo;
  print("Emprestimos:");
  for (emprestimo in loan) {
    print("${loan.indexOf(emprestimo) + 1}º empréstimo:");
    emprestimo.forEach((key, value) {
      print("$key : $value");
    });
    linha();
  }
  //area de pix
  showExtractPix();

  // //area de transferencia
  showExtractTransfer();
  // Map<String, dynamic> transferencia;
  // print("Emprestimos:");
  // for (transferencia in loan) {//troca o loan pelo map da transferencia
  //   print("${loan.indexOf(transferencia) + 1}º empréstimo:");
  //   transferencia.forEach((key, value) {
  //     print("$key : $value");
  //   });
  //   linha();
  // }

  // o seu saldo do dia sera de *******
  linha();
  showBalance();
  // print("Saldo atual: $balance");
  linha();
  voltarOuSair();
}

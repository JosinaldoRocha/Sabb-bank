import '../saldo e extrato/voltar_ou_sair.dart';
import '../../util/linha.dart';
import '../../variables/caluladora_do_saldo.dart';

void mostrarExtrato() {
  print("|=============| Extrato |===========|");

  //area de deposito
  Map<String, dynamic> deposito;
  print("Depositos:");
  for (deposito in allDeposits) {
    print("${allDeposits.indexOf(deposito) + 1}º Depósito:");
    deposito.forEach((key, value) {
      print("$key : $value");
    });
    linha();
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

  // //area de pix
  // Map<String, dynamic> pix;
  // print("Emprestimos:");
  // for (pix in loan) {//troca o loan pelo map do pix
  //   print("${loan.indexOf(pix) + 1}º empréstimo:");
  //   pix.forEach((key, value) {
  //     print("$key : $value");
  //   });
  //   linha();
  // }

  // //area de transferencia
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
  print("Saldo atual: ${mostra()}");
  linha();
  voltarOuSair();
}

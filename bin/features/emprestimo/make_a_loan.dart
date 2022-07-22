import '../../util/clean_screen.dart';
import '../../util/read.dart';
import '../../variables/caluladora_do_saldo.dart';
import '../../variables/users.dart';
import '../home/home.dart';

Map<String, dynamic> loanUser = {};
Map<String, dynamic> loanUserError = {};
late double loanAmount;
void empresta(double value, int time, double tax, double salary) {
  tax = (tax / 100);
  salary = (salary * 0.3);
  double emprestimoPedido = value;

  double fees = value * (tax * time);
  loanAmount = value += fees;
  int parcelas = time * 12;
  double installmentValue = value / parcelas;
  cleanScreen();
  if (installmentValue <= salary && currentUser["senha"] == password) {
    balanceUSer[currentUser["nome"]] += emprestimoPedido;
    balance = balanceUSer[currentUser["nome"]];

    print("Empréstimo_aceito");
    loan.add({
      "emprestimo_pedido": emprestimoPedido,
      "valor_a_pagar": loanAmount.toStringAsFixed(2),
      "valor_do_juros": fees.toStringAsFixed(2),
      "quantidade_de_parcelas": parcelas,
      "tempo_em_anos": time,
      "valor_de_cada_parcela": installmentValue.toStringAsFixed(2),
      "taxa_de_juros_anual": tax * 100
    });

    if (loanUser[currentUser["nome"]] == null) {
      loanUser[currentUser["nome"]] = loan;
    } else {
      loanUser[currentUser["nome"]] += loan;
    }

    loan = [];

    Map<String, dynamic> valor = {
      "valor": emprestimoPedido,
    };
    money1.add(valor);
  } else {
    print("Empréstimo Recusado");
    loanError.add({
      "emprestimo_pedido": emprestimoPedido,
      "valor_a_pagar": value,
      "valor_do_juros": fees,
      "quantidade_de_parcelas": parcelas,
      "tempo_em_anos": time,
      "valor_de_cada_parcela": installmentValue,
      "taxa_de_juros_anual": tax * 100
    });

    if (loanUserError[currentUser["nome"]] == null) {
      loanUserError[currentUser["nome"]] = loanError;
    } else {
      loanUserError[currentUser["nome"]] += loanError;
    }
    loanError = [];
  }
}

void informations() {
  double value = readDouble(message: "Qual o valor do empréstimo? ");
  int time = 6;
  while (time > 5) {
    time = readInt(message: "Em quantos anos deseja paga?");
    if (time > 5) print("O tempo de pagamento se limita a 5 anos ou menos");
  }
  double salary = readDouble(message: "Qual sua renda mensal?");
  print("Usuário : ${currentUser["nome"]}");
  password = readString(message: "Digite sua senha:");
  empresta(value, time, 12, salary);
}

String password = "";

void loanExtract() {
  if (loanUser[currentUser["nome"]] == null) {
    print('Nenhum empréstimo realizado!');
  } else {
    print('-----------------------------');
    for (var element in loanUser[currentUser["nome"]]) {
      print('Valor pedido: ${element["emprestimo_pedido"]}');
      print('Valor a pagar: ${element["valor_a_pagar"]}');
      print('Juros: ${element["valor_do_juros"]}');
      print('Total de parcelas: ${element["quantidade_de_parcelas"]}');
      print('Quantidade de anos: ${element["tempo_em_anos"]}');
      print('Valor de cada parcela: ${element["valor_de_cada_parcela"]}');
      print('Juros anual: ${element["taxa_de_juros_anual"]}');
      print('-----------------------------\n');
    }
  }
}

void loanExtractError() {
  if (loanUserError[currentUser["nome"]] == null) {
    print('Nenhum empréstimo recusado!');
  } else {
    print('-----------------------------');
    for (var element in loanUserError[currentUser["nome"]]) {
      print('Valor pedido: ${element["emprestimo_pedido"]}');
      print('Valor a pagar: ${element["valor_a_pagar"]}');
      print('Juros: ${element["valor_do_juros"]}');
      print('Total de parcelas: ${element["quantidade_de_parcelas"]}');
      print('Quantidade de anos: ${element["tempo_em_anos"]}');
      print('Valor de cada parcela: ${element["valor_de_cada_parcela"]}');
      print('Juros anual: ${element["taxa_de_juros_anual"]}');
      print('-----------------------------\n');
    }
  }
}

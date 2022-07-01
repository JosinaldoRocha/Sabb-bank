import 'dart:io';

List<Map<String, dynamic>> myAccount = [
  {
    "Nome": "Gabriel",
    "Saldo": 1.500,
  }
];

List<Map<String, dynamic>> registerTrasfer = [
  {
    "banco": "Brasil",
    "nome": "Gabriel",
    "agencia": 2345,
    "conta": 12345678,
    "digito": 3,
    "senha": 123456,
  }
];

void main() {
  String answer;
  do {
    titleTrasfer();

    print("Temos essas opção para voce escolher: ");

    print("(1). Entre na conta do caixa");
    print("(2). Banco Ted");
    print("(3). Sair da conta");

    print("-----------------------------------------------");

    print("Digite a opção que voce quer: ");
    String opitionText = stdin.readLineSync() ?? "";
    int opition = int.tryParse(opitionText) ?? 0;

    if (opition == 1) {
      welcomeTrasfer();
    }

    if (opition == 2) {
      tedTrasfer();
    }
    print("Você deseja continuar? s / n");
    answer = stdin.readLineSync() ?? "";
  } while (answer == "s");
}

titleTrasfer() {
  print("----------------------------------------------------------------");
  print("----------------------------------------------------------------");
  print("--------------    Bem vindo a traferencia    -------------------");
  print("----------------------------------------------------------------");
  print("----------------------------------------------------------------");
}

welcomeTrasfer() {
  print(myAccount.toString());
}

tedTrasfer() {
  print("--------------------------------- ");
  print("------- Bem vindo ao Ted ---------");
  print("----------------------------------");

  print("digite o nome do banco:");
  String nameBank = stdin.readLineSync() ?? "";

  print("-------------------------------------------");

  print("Escolha uma opção");

  print("(1). Conta Corrente");
  print("(2). Conta Poupança");

  print("-------------------------------------------");

  print("Digite o tipo de conta: ?");
  String? accountext = stdin.readLineSync();
  int account = int.tryParse(accountext ?? "0") ?? 0;

  switch (account) {
    case 1:
      print("Conta Corrente");
      break;
    case 2:
      print("Conta Poupança");
      break;
    default:
  }

  print("-------------------------------------------");

  print("digite o nome do beneficiario:");
  String name = stdin.readLineSync() ?? "";

  print("Digite o numero da agencia");
  String? agenciatext = stdin.readLineSync();
  int agency = int.tryParse(agenciatext ?? "0") ?? 0;

  print("digite o numero da conta");
  String? countText = stdin.readLineSync();
  int count = int.tryParse(countText ?? "0") ?? 0;

  print("Digite o Digito da pessoa: ");
  String? digitText = stdin.readLineSync();
  int digit = int.tryParse(digitText ?? "0") ?? 0;

  print("Digite a senha para trasferir o dinheiro");
  String? passwordText = stdin.readLineSync();
  int password = int.tryParse(passwordText ?? "0") ?? 0;

  bool welTrasfer = registerTrasfer.any((element) =>
      element["banco"] == nameBank &&
      element["nome"] == name &&
      element["agencia"] == agency &&
      element["conta"] == count &&
      element["digito"] == digit &&
      element["senha"] == password);

  if (welTrasfer) {
    print("traferencia aceita");
  } else {
    print("trasferencia negada");
    tedTrasfer();
  }
}

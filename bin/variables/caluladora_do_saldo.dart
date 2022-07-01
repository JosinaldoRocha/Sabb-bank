List<Map<String, dynamic>> allDeposits = []; //aqui adiciona todos os depósitos
List<Map<String, dynamic>> loan = [];
List<Map<String, dynamic>> loanError = [];
List<Map<String, dynamic>> money1 = [];
Map<String, dynamic> balanceUSer = {};

// double balance = mostra();

double mostra() {
  double saldo1 = 0;
  for (var element in money1) {
    saldo1 += element["valor"];
  }
  return saldo1;
}

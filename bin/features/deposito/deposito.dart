import '../../util/read.dart';
import '../../variables/caluladora_do_saldo.dart';
import '../../variables/users.dart';
import '../home/Home.dart';
import 'void.dart';

Map<String, dynamic> valor = {};
Future<void> depos() async {
  valor = {};
  double value = readDouble(message: "Digite o Valor do Deposito:? ");

  print("Carregando.......... espere alguns segundos................");

  await Future.delayed(Duration(seconds: 3));

  print("Você depositou: R\$$value.");
  balance += value;

  balanceUSer.addAll({currentUser["nome"]: balance});

  users.add(balanceUSer);

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
  String answer;
  do {
    String answertext =
        readString(message: "voce deseja realizar outro deposito:?");
    answer = answertext;
    if (answer == "s") {
      main();
    }
  } while (answer == "s");
  home();
}

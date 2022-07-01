import 'dart:io';
import 'step2.dart';
import '../../variables/users.dart';
import 'dart:math' as math;

Map<String, dynamic> user = {};

void step3() {
  print("---------------------------------------------");
  print(" informe seus dados para fazero seu cadastro:");
  print("---------------------------------------------");

  print("|1| digite seu nome");
  String nome = stdin.readLineSync() ?? "";
  print("|2| digite seu sobrenome");
  String sobrenome = stdin.readLineSync() ?? "";
  print("|3|digite seu cpf ");
  String cpf = stdin.readLineSync() ?? "";
  print("|4| digite seu numero telefone");
  String telefone = stdin.readLineSync() ?? "";
  print("|10| digite seu email");
  String email = stdin.readLineSync() ?? "";
  print("|11| digite sua senha");
  String senha = stdin.readLineSync() ?? "";

  user = {
    "Agencia": 2345,
    "conta": math.Random().nextInt(1000), // conta usuarios
    "digito": 3,
    "nome": nome,
    "sobrenome": sobrenome,
    "cpf": cpf,
    "telefone": telefone,
    "email": email,
    "senha": senha
  };

  users.add(user);

  print("\nCadastro realizado:");

  step2();
}

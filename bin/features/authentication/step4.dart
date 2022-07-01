import 'dart:io';
import '../home/Home.dart';
import 'step2.dart';
import '../../variables/users.dart';

void step4() {
  print("-----------------------------------");
  print("digite seu login para acessar o app");
  print("-----------------------------------");

  print("digite seu email:");
  String email = stdin.readLineSync() ?? "";

  print("digite sua senha:");
  String senha = stdin.readLineSync() ?? "";

  bool userAuthentic = users
      .any((element) => element["email"] == email && element["senha"] == senha);

  if (userAuthentic) {
    currentUser = users.firstWhere(
        (element) => element["email"] == email && element["senha"] == senha);
    home();
    
  } else {
    print("usuario nao atenticado faca seu cadastro para acessar o app");
    step2();
  }
}

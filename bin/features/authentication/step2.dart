import 'dart:io';
import '../home/Home.dart';
import 'step3.dart';
import 'step4.dart';

void step2() {
  balance = 0;
  print("-----------------------");
  print("|1| para fazer login");
  print("-----------------------");
  print("-----------------------");
  print("|2| para fazer cadastro");
  print("-----------------------");
  print("-----------------------");
  print("|3| Sair");
  print("-----------------------");

  String? escolhatext = stdin.readLineSync();
  int escolha = int.tryParse(escolhatext ?? "0") ?? 0;

  if (escolha == 1) {
    step4();
  } else if (escolha == 2) {
    step3();
  } else {}
}

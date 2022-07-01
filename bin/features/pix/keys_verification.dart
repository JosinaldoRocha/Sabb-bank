import '../../util/clean_screen.dart';
import '../../util/read.dart';
import '../../variables/pix.dart';
import '../../variables/users.dart';
import '../authentication/step3.dart';
import '../home/Home.dart';
import 'register_new_key.dart';

bool sameKeys = true;
void keysVerification() {
  if (type == 1) {
    cpfCnpj();
  } else if (type == 2) {
    cell();
  } else if (type == 3) {
    email();
  } else if (type == 4) {
    random();
  }
}

void cpfCnpj() {
  bool positiveKey = false;

  while (positiveKey == false) {
    sameKeys = true;
    while (sameKeys) {
      newKey = readString(message: "CPF/CNPJ:");
      sameKeys = users.any((element) => element["chave"] == newKey);
      positiveKey = newKey.length == 11 || newKey.length == 14;

      if (positiveKey) {
        if (!sameKeys) {
          type -= 1;
          user.addAll({"tipo": typeKey[type]});
          user.addAll({"chave": newKey});
          user.addAll({"usuário": currentUser["nome"]});
          user.addAll({"saldo": balance});
          keysOneUSer.add(user);

          print('\nNova chave cadastrada! :)');
          print('Tipo de chave: ${user["tipo"]}\n'
              'Chave: ${user["chave"]}\n');
        } else {
          print(
              '\n     <<Chave, já cadastrada!>>\nDigite uma chave ${typeKey[type]} diferente.');
        }
      } else {
        print('\nChave inválida!\nDigite um número de CPF/CNPJ válido!');
      }
    }
  }
  cleanScreen();
}

void cell() {
  bool positiveKey = false;

  while (positiveKey == false) {
    sameKeys = true;

    while (sameKeys) {
      newKey = readString(message: "Celular:");
      sameKeys = users.any((element) => element["chave"] == newKey);
      positiveKey = newKey.length == 11;

      if (positiveKey) {
        // addKey();
        if (!sameKeys) {
          type -= 1;
          user.addAll({"tipo": typeKey[type]});
          user.addAll({"chave": newKey});
          user.addAll({"usuário": currentUser["nome"]});
          user.addAll({"saldo": balance});
          keysOneUSer.add(user);

          print('\nNova chave cadastrada! :)');
          print('Tipo de chave: ${user["tipo"]}\n'
              'Chave: ${user["chave"]}\n');
        } else {
          print(
              '\n     <<Chave, já cadastrada!>>\nDigite um número de celular diferente.');
        }
      } else {
        print('\nChave inválida!\nDigite um número de celular válido!');
      }
    }
  }
  cleanScreen();
}

void email() {
  sameKeys = true;
  while (sameKeys) {
    newKey = readString(message: "E-mail:");
    sameKeys = users.any((element) => element["chave"] == newKey);

    if (!sameKeys) {
      type -= 1;
      user.addAll({"tipo": typeKey[type]});
      user.addAll({"chave": newKey});
      user.addAll({"usuário": currentUser["nome"]});
      user.addAll({"saldo": balance});
      keysOneUSer.add(user);

      print('\nNova chave cadastrada! :)');
      print('Tipo de chave: ${user["tipo"]}\n'
          'Chave: ${user["chave"]}\n');
    } else {
      print('     <<Chave, já cadastrada!>>\nDigite um e-mail diferente.\n');
    }
  }
  cleanScreen();
}

void random() {
  sameKeys = true;
  while (sameKeys) {
    newKey = readString(message: "Chave aleatória:");
    sameKeys = users.any((element) => element["chave"] == newKey);

    if (!sameKeys) {
      type -= 1;
      user.addAll({"tipo": typeKey[type]});
      user.addAll({"chave": newKey});
      user.addAll({"usuário": currentUser["nome"]});
      user.addAll({"saldo": balance});
      keysOneUSer.add(user);

      print('\nNova chave cadastrada! :)');
      print('Tipo de chave: ${user["tipo"]}\n'
          'Chave: ${user["chave"]}\n');
    } else {
      print('     <<Chave, já cadastrada!>>\nDigite uma chave diferente.\n');
    }
  }
  cleanScreen();
}

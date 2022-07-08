import '../../util/read.dart';
import 'step2.dart';
import '../../variables/users.dart';

Map<String, dynamic> user = {};
late String cpf;

void step3() {
  print("---------------------------------------------");
  print(" informe seus dados para fazer o seu cadastro:");
  print("---------------------------------------------");

  String name = readString(message: 'Digite seu nome:');

  String lastName = readString(message: 'Digite seu sobrenome:');

  registerCpf();

  bool positivePhone = false;
  String phoneNumber = "";
  while (positivePhone == false) {
    phoneNumber = readString(message: 'Digite seu numero telefone:');
    positivePhone = phoneNumber.length == 11;
    if (positivePhone) {
    } else {
      print('\nTelefone inválido!\nDigite um número de telefone válido!');
    }
  }

  int account = 0;
  while (account == 0) {
    account = readInt(message: 'Digite um número para a  nova conta:');
    bool positiveAccount = users.any((element) => element["conta"] == account);
    if (!positiveAccount) {
    } else {
      account = 0;
      print('Conta existente. Tente cadastrar um número de conta diferente!');
    }
  }

  String email = "";
  while (email == "") {
    email = readString(message: 'Digite seu e-mail:');
    bool positiveEmail = users.any((element) => element["email"] == email);
    if (!positiveEmail) {
    } else {
      email = "";
      print('E-mail existente. Tente cadastrar um e-mail diferente!');
    }
  }

  String password = readString(message: 'Digite uma senha:');

  user = {
    "Agencia": 2345,
    "conta": account,
    "digito": 0,
    "nome": name,
    "sobrenome": lastName,
    "cpf": cpf,
    "telefone": phoneNumber,
    "email": email,
    "senha": password
  };

  users.add(user);

  print("\nCadastro realizado:");

  step2();
}

void registerCpf() {
  bool positiveCpf = false;
  cpf = "";
  while (positiveCpf == false) {
    cpf = "";
    while (cpf == "") {
      cpf = readString(message: 'Digite seu cpf:');
      positiveCpf = cpf.length == 11;
      if (positiveCpf) {
        bool existingCpf = users.any((element) => element["cpf"] == cpf);
        if (!existingCpf) {
        } else {
          cpf = "";
          print('Cpf existente. Tente cadastrar um número de CPF diferente!');
        }
      } else {
        print('\nCPF inválido!\nDigite um número de CPF válido!');
      }
    }
  }
}

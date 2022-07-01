import 'dart:io';
String readString ({String? message}){
  if(message != null){
    print(message);
  }
  String? value = stdin.readLineSync() ?? "";
  return value;
}

double readDouble ({String? message}){
  if(message != null){
    print(message);
  }
  String? numberText = stdin.readLineSync();
  double number = double.tryParse(numberText ?? "0") ?? 0;
  return number;
}

int readInt ({String? message}){
  if(message != null){
    print(message);
  }
  String? numberText = stdin.readLineSync();
  int number = int.tryParse(numberText ?? "0") ?? 0;
  return number;
}
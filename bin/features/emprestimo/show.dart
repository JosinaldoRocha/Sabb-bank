import '../../util/clean_screen.dart';
import 'make_a_loan.dart';

void vizualizar() {
  cleanScreen();
  print("Emprestimos aprovados");
  loanExtract();

  print("Empréstimos negados");
  loanExtractError();
}

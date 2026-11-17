//THIAGO GUERRA SOARES
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_tp4/main.dart';

void main() {
  testWidgets('Exibe a tela inicial e o nome do aluno', (tester) async {
    await tester.pumpWidget(const AplicativoTurismo());
    expect(find.text(Principal.nomeAluno), findsOneWidget);
    expect(find.text('Pontos turísticos da Baixada Santista'), findsOneWidget);
  });
}

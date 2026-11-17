//THIAGO GUERRA SOARES
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_tp4/main.dart';

void main() {
  testWidgets('Exibe a tela inicial e o nome do aluno', (tester) async {
    await tester.pumpWidget(const AplicativoTurismo());
    expect(find.text(Principal.nomeAluno), findsOneWidget);
    expect(find.text('Pontos turísticos da Baixada Santista'), findsOneWidget);
  });

  testWidgets('Marcações são independentes e permanecem durante a rolagem', (
    tester,
  ) async {
    tester.view.physicalSize = const Size(390, 844);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    await tester.pumpWidget(const AplicativoTurismo());
    await tester.pumpAndSettle();

    Finder checkboxDoPonto(String nome, int indice) {
      final card = find.ancestor(
        of: find.text(nome),
        matching: find.byType(Container),
      );
      return find
          .descendant(of: card, matching: find.byType(Checkbox))
          .at(indice);
    }

    final favorito = checkboxDoPonto('Monte Serrat', 0);
    final visitado = checkboxDoPonto('Monte Serrat', 1);
    await tester.ensureVisible(favorito);
    await tester.tap(favorito);
    await tester.pump();
    expect(tester.widget<Checkbox>(favorito).value, isTrue);
    expect(tester.widget<Checkbox>(visitado).value, isFalse);

    await tester.tap(visitado);
    await tester.pump();
    expect(tester.widget<Checkbox>(favorito).value, isTrue);
    expect(tester.widget<Checkbox>(visitado).value, isTrue);

    await tester.scrollUntilVisible(find.text('Ilha Porchat'), 400);
    await tester.pumpAndSettle();
    expect(
      tester.widget<Checkbox>(checkboxDoPonto('Ilha Porchat', 0)).value,
      isFalse,
    );
    expect(
      tester.widget<Checkbox>(checkboxDoPonto('Ilha Porchat', 1)).value,
      isFalse,
    );

    await tester.scrollUntilVisible(find.text('Monte Serrat'), -400);
    await tester.ensureVisible(favorito);
    await tester.pumpAndSettle();
    expect(tester.widget<Checkbox>(favorito).value, isTrue);
    expect(tester.widget<Checkbox>(visitado).value, isTrue);

    await tester.tap(favorito);
    await tester.tap(visitado);
    await tester.pump();
    expect(tester.widget<Checkbox>(favorito).value, isFalse);
    expect(tester.widget<Checkbox>(visitado).value, isFalse);
  });
}

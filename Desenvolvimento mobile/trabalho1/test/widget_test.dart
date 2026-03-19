import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:trabalho1/main.dart';

void main() {
  testWidgets('Tela inicial carrega corretamente', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    // Verifica se o título aparece
    expect(find.text('Pedra, Papel, Tesoura'), findsOneWidget);

    // Verifica se o texto principal aparece
    expect(find.text('Escolha do APP'), findsOneWidget);

    // Verifica se existem 3 botões (pedra, papel, tesoura)
    expect(find.byType(GestureDetector), findsNWidgets(3));
  });

  testWidgets('Navegação para tela de resultado funciona',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    // Clica no primeiro botão (pedra)
    await tester.tap(find.byType(GestureDetector).first);
    await tester.pumpAndSettle();

    // Verifica se foi para a tela de resultado
    expect(find.text('Sua Escolha'), findsOneWidget);
    expect(find.text('Escolha do APP'), findsOneWidget);
  });
}

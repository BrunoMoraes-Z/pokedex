import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:pokedex/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  const errorNotFound = Key('error_not_found');
  const loading = Key('loading');
  const pokecard = Key('pokemoncard-1');
  const pokefield = Key('pokemon_search_field');

  group('Validate Home Screen »', () {
    testWidgets('Primeiro loading ao abrir o APP.', (tester) async {
      app.main();
      await tester.pump();

      expect(find.byKey(loading), findsOneWidget);
      await tester.pumpAndSettle();
    });

    testWidgets('Carregamendo dos Cards.', (tester) async {
      app.main();
      await tester.pumpAndSettle();
      expect(find.byKey(pokecard), findsOneWidget);
    });

    testWidgets('Filtro com sucesso.', (tester) async {
      app.main();
      await tester.pumpAndSettle();

      await tester.enterText(find.byKey(pokefield), 'charmander');
      await tester.tap(find.text('Pokédex'));
      await tester.pumpAndSettle();
      expect(find.byKey(const Key('pokemoncard-4')), findsOneWidget);
      expect(find.text('Charmander'), findsOneWidget);
      expect(find.byKey(errorNotFound), findsNothing);
    });

    testWidgets('Filtro sem sucesso.', (tester) async {
      app.main();
      await tester.pumpAndSettle();

      await tester.enterText(find.byKey(pokefield), 'charmanderr');
      await tester.tap(find.text('Pokédex'));
      await tester.pump();
      expect(find.byKey(loading), findsOneWidget);
      await Future.delayed(const Duration(seconds: 3));
      await tester.pump();
      expect(find.byKey(errorNotFound), findsOneWidget);
    });

    testWidgets('Filtro pokemon ainda não baixado.', (tester) async {
      app.main();
      await tester.pumpAndSettle();

      await tester.enterText(find.byKey(pokefield), 'mewtwo');
      await tester.tap(find.text('Pokédex'));
      await tester.pump();
      expect(find.byKey(loading), findsOneWidget);
      await Future.delayed(const Duration(seconds: 3));
      await tester.pump();
      expect(find.text('Mewtwo'), findsOneWidget);
      expect(find.byKey(errorNotFound), findsNothing);
    });
  });
}

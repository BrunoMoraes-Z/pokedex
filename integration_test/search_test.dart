import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:pokedex/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  const pokecard = Key('pokemoncard-1');
  // Components
  const pokemonName = Key('pokemon_name');
  const pokemonId = Key('pokemon_id');
  const pokemonTypes = Key('pokemon_types');
  const pokemonWeight = Key('pokemon_weight');
  const pokemonHeight = Key('pokemon_height');
  const pokemonSkills = Key('pokemon_skills');
  const shinyButton = Key('shiny_button');

  Future<void> _selectFirstPokemon(WidgetTester tester) async {
    await tester.pumpAndSettle();
    expect(find.byKey(pokecard), findsOneWidget);
    await tester.tap(find.byKey(pokecard));
    await tester.pumpAndSettle();
  }

  group('Validate Pokemon Detail Screen »', () {
    testWidgets('Primeiro loading ao abrir o APP.', (tester) async {
      app.main();
      await tester.pumpAndSettle();
      expect(find.byKey(pokecard), findsOneWidget);
      await tester.tap(find.byKey(pokecard));
      await tester.pumpAndSettle();
    });

    testWidgets('Listando Components', (tester) async {
      app.main();
      await _selectFirstPokemon(tester);
      expect(find.byKey(pokemonName), findsOneWidget);
      expect(find.byKey(pokemonId), findsOneWidget);
      expect(find.byKey(pokemonTypes), findsOneWidget);
      expect(find.byKey(pokemonWeight), findsOneWidget);
      expect(find.byKey(pokemonHeight), findsOneWidget);
      expect(find.byKey(pokemonSkills), findsOneWidget);
      expect(find.byKey(shinyButton), findsOneWidget);
    });

    testWidgets('Trocar Shiny', (tester) async {
      app.main();
      await _selectFirstPokemon(tester);
      var element = find.byKey(shinyButton);
      expect(element, findsOneWidget);
      expect(find.byIcon(Icons.star_border), findsOneWidget);
      await tester.tap(element);
      await tester.pump();
      expect(find.byIcon(Icons.star), findsOneWidget);
    });
  });
}

import 'package:flutter_test/flutter_test.dart';
import 'package:pokedex/controllers/pokemon_controller.dart';
import 'package:pokedex/repositories/pokemon_repository.dart';

void main() {
  late PokemonRepository pokemonRepository;
  late PokemonController pokemonController;
  const maxLoadingTime = 28;

  setUp(() {
    pokemonRepository = PokemonRepository();
    pokemonController = PokemonController(
      pokemonRepository: pokemonRepository,
    );
  });

  Future<void> waitLoading(int times) async {
    if (pokemonController.isFetchingMore() && times > 0) {
      await Future.delayed(const Duration(milliseconds: 100));
      return waitLoading(times - 1);
    } else {
      return Future.value();
    }
  }

  test('List of pokemons is not empty', () async {
    expect(pokemonController.pokemons(), isEmpty);
    await waitLoading(maxLoadingTime);
    expect(pokemonController.pokemons(), isNotEmpty);
  });

  test('Filter a valid pokemon', () async {
    await waitLoading(maxLoadingTime);
    pokemonController.onChange('charmander');
    expect(pokemonController.pokemons(), hasLength(1));
  });

  test('Filter a invalid pokemon', () async {
    await waitLoading(maxLoadingTime);
    pokemonController.onChange('charmanderr');
    expect(pokemonController.pokemons(), hasLength(0));
  });

  test('Load more pokemons', () async {
    await waitLoading(maxLoadingTime);
    var before = pokemonController.pokemons().length;
    await pokemonController.fetchMore();
    await waitLoading(maxLoadingTime);
    expect(pokemonController.pokemons().length, greaterThan(before));
  });
}

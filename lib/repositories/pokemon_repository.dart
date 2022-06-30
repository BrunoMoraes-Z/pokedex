import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:pokedex/models/pokemon.dart';
import 'package:pokedex/shared/constants.dart';

class PokemonRepository {
  final List<Pokemon> _pokemons = [];
  late int _last = 0;

  Future<List<Pokemon>> fetchAllPokemons() async {
    final response = await http.get(
      Uri.parse('$baseApiUrl/pokemon/?limit=50'),
    );
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      _last = json['count'];
      final pokemons =
          (json['results'] as List).map((e) => Pokemon.fromMap(e)).toList();
      _pokemons.clear();
      _pokemons.addAll(pokemons);
      return Future.value(pokemons);
    }

    return Future.value([]);
  }

  Future<Pokemon?> searchPokemon(String pokemonName) async {
    final response = await http.get(
      Uri.parse('$baseApiUrl/pokemon/$pokemonName'),
    );

    if (response.statusCode == 200) {
      var pokemon = Pokemon.fromMap({
        'name': '',
        'url': '$baseApiUrl/pokemon/$pokemonName',
      });
      await pokemon.loadInfos();
      _pokemons.add(pokemon);
      return pokemon;
    }
    return Future.value(null);
  }

  Future<List<Pokemon>> fetchMorePokemons() async {
    final response = await http.get(
      Uri.parse('$baseApiUrl/pokemon/?limit=50&offset=${_pokemons.length}'),
    );
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);

      return Future.value(
        (json['results'] as List).map((e) => Pokemon.fromMap(e)).toList(),
      );
    }

    return Future.value([]);
  }

  List<Pokemon> get pokemons => _pokemons;
  int get last => _last;

  List<Pokemon> updatePokemons(List<Pokemon> pokemons) {
    _pokemons.addAll(pokemons);
    return _pokemons;
  }
}

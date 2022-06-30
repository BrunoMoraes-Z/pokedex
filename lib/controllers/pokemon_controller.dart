// ignore_for_file: avoid_function_literals_in_foreach_calls

import 'package:flutter/material.dart';
import 'package:pokedex/models/pokemon.dart';
import 'package:pokedex/repositories/pokemon_repository.dart';

class PokemonController extends ChangeNotifier {
  final PokemonRepository pokemonRepository;
  late String term = '';
  late bool _fetching = false;

  PokemonController({
    required this.pokemonRepository,
  }) {
    _loadAll();
  }

  _loadAll() async {
    _fetching = true;
    var pokemons = await pokemonRepository.fetchAllPokemons();
    notifyListeners();

    await Future.wait(pokemons.map((e) async {
      try {
        return await e.loadInfos();
      } catch (ex) {
        return e;
      }
    }).toList());

    _fetching = false;
    notifyListeners();
  }

  fetchMore() async {
    if (term.trim().isNotEmpty) {
      return;
    }
    if (pokemonRepository.pokemons.length < 10) return;
    if (_fetching) return;
    if (pokemonRepository.pokemons.length < pokemonRepository.last) {
      _fetching = true;
      var pokemons = await pokemonRepository.fetchMorePokemons();
      pokemonRepository.updatePokemons(pokemons);
      notifyListeners();

      await Future.wait(pokemons.map((e) async {
        try {
          return await e.loadInfos();
        } catch (ex) {
          return e;
        }
      }).toList());
      _fetching = false;
      notifyListeners();
    }
  }

  bool isFetchingMore() {
    return _fetching;
  }

  List<Pokemon> pokemons() {
    if (term.trim().isEmpty) {
      return pokemonRepository.pokemons;
    }
    var list = pokemonRepository.pokemons
        .where((element) => element.name.toLowerCase().contains(term.trim()))
        .toList();
    if (list.isEmpty) {
      if (!_fetching) searchPokemon(term);
    }
    return list;
  }

  searchPokemon(String pokemonName) async {
    _fetching = true;
    await pokemonRepository.searchPokemon(pokemonName);
    _fetching = false;
    notifyListeners();
  }

  String onChange(String value) {
    term = value;
    notifyListeners();
    return term;
  }
}

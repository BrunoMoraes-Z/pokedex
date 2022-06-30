import 'package:flutter/material.dart';
import 'package:pokedex/models/pokemon.dart';
import 'package:pokedex/shared/app_styles.dart';

import 'pokemon_stat_line.dart';

class PokemonStats extends StatelessWidget {
  const PokemonStats({
    Key? key,
    required this.pokemon,
  }) : super(key: key);

  final Pokemon pokemon;

  @override
  Widget build(BuildContext context) {
    var color = PokeTypeColors.fromName(pokemon.types.first);
    return Column(
      children: [
        Text(
          'Status Base',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: color,
            fontSize: 16,
          ),
        ),
        PokemonStatLine(
          stat: 'HP',
          amount: pokemon.stats['hp'] ?? 0,
          color: color,
        ),
        PokemonStatLine(
          stat: 'ATK',
          amount: pokemon.stats['attack'] ?? 0,
          color: color,
        ),
        PokemonStatLine(
          stat: 'DEF',
          amount: pokemon.stats['defense'] ?? 0,
          color: color,
        ),
        PokemonStatLine(
          stat: 'SATK',
          amount: pokemon.stats['special-attack'] ?? 0,
          color: color,
        ),
        PokemonStatLine(
          stat: 'SDEF',
          amount: pokemon.stats['special-defense'] ?? 0,
          color: color,
        ),
        PokemonStatLine(
          stat: 'SPD',
          amount: pokemon.stats['speed'] ?? 0,
          color: color,
        ),
        const SizedBox(height: 30),
      ],
    );
  }
}

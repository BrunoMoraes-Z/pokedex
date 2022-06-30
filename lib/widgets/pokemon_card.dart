import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:pokedex/models/pokemon.dart';
import 'package:pokedex/screens/detail_screen.dart';
import 'package:pokedex/shared/app_styles.dart';

import '../shared/extensions.dart';

class PokemonCard extends StatelessWidget {
  const PokemonCard({
    Key? key,
    required this.pokemon,
  }) : super(key: key);

  final Pokemon pokemon;

  @override
  Widget build(BuildContext context) {
    var newCode = '${pokemon.id}'.padLeft(2, '0');
    var baseColor = pokemon.types.isEmpty
        ? PokeTypeColors.normal
        : PokeTypeColors.fromName(pokemon.types.first);
    return Material(
      elevation: 3,
      borderRadius: BorderRadius.circular(12),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailScreen(
                pokemon: pokemon,
              ),
            ),
          );
        },
        borderRadius: BorderRadius.circular(12),
        child: Container(
          padding: const EdgeInsets.only(
            top: 4,
          ),
          height: MediaQuery.of(context).size.width * 0.30,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: baseColor,
              width: 0.5,
            ),
          ),
          child: Stack(
            children: [
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        '#$newCode',
                        style: TextStyle(
                          color: baseColor,
                        ),
                      ),
                      const SizedBox(width: 8),
                    ],
                  ),
                  const Spacer(),
                  Container(
                    height: 30,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: baseColor,
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(12),
                        bottomRight: Radius.circular(12),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        pokemon.name.toUpperFirstLetter(),
                        style: const TextStyle(
                          fontSize: 12,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  )
                ],
              ),
              Align(
                alignment: Alignment.center,
                child: pokemon.image.isEmpty
                    ? Center(
                        child: Lottie.asset(
                          'assets/loading.json',
                          height: 30,
                        ),
                      )
                    : Hero(
                        tag: Key('img-${pokemon.id}'),
                        child: Image.network(
                          pokemon.image,
                          loadingBuilder: (context, child, progress) {
                            if (progress == null) {
                              return child;
                            } else {
                              return Center(
                                child: Lottie.asset(
                                  'assets/loading.json',
                                  height: 30,
                                ),
                              );
                            }
                          },
                          fit: BoxFit.cover,
                        ),
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

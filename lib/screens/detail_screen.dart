import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:lottie/lottie.dart';
import 'package:pokedex/models/pokemon.dart';
import 'package:pokedex/shared/app_styles.dart';
import 'package:pokedex/widgets/my_vertical_divider.dart';
import 'package:pokedex/widgets/pokemon_card_about_ability.dart';
import 'package:pokedex/widgets/pokemon_card_about_info.dart';
import 'package:pokedex/widgets/pokemon_stats.dart';
import 'package:pokedex/widgets/pokemon_type_card.dart';

import '../shared/extensions.dart';

class DetailScreen extends HookWidget {
  const DetailScreen({
    Key? key,
    required this.pokemon,
  }) : super(key: key);

  final Pokemon pokemon;

  @override
  Widget build(BuildContext context) {
    var viewShiny = useState(false);

    return Scaffold(
      body: SafeArea(
        child: Container(
          height: double.infinity,
          decoration: BoxDecoration(
            color:
                PokeTypeColors.fromName(pokemon.types.first).withOpacity(0.95),
          ),
          child: Stack(
            children: [
              // BackGround Image
              Align(
                alignment: Alignment.topRight,
                child: Container(
                  margin: const EdgeInsets.all(8),
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      alignment: Alignment.topRight,
                      image: AssetImage(
                        'assets/pokeball.png',
                      ),
                      opacity: 0.05,
                      scale: 0.9,
                    ),
                  ),
                ),
              ),

              // Header
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 16,
                ),
                child: Row(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                        size: 26,
                      ),
                    ),
                    const SizedBox(width: 24),
                    Text(
                      pokemon.name.toUpperFirstLetter(),
                      key: const Key('pokemon_name'),
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const Spacer(),
                    Text(
                      '#${"${pokemon.id}".padLeft(3, '0')}',
                      key: const Key('pokemon_id'),
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),

              // Card
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  constraints: const BoxConstraints(
                    maxHeight: 400,
                  ),
                  margin: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Container(
                    margin: const EdgeInsets.only(
                      left: 8,
                      right: 8,
                      bottom: 8,
                      top: 64,
                    ),
                    height: double.infinity,
                    width: double.infinity,
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          // Tags
                          Row(
                            key: const Key('pokemon_types'),
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ...pokemon.types.map(
                                (e) => PokemonTypeCard(
                                  type: e.toPortuguese().toUpperFirstLetter(),
                                  color: PokeTypeColors.fromName(e),
                                ),
                              )
                            ],
                          ),

                          // Sobre o Pokemon
                          Container(
                            margin: const EdgeInsets.symmetric(vertical: 8),
                            child: Text(
                              'Sobre',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: PokeTypeColors.fromName(
                                    pokemon.types.first),
                                fontSize: 16,
                              ),
                            ),
                          ),

                          SizedBox(
                            height: 75,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                PokemonCardAboutInfo(
                                  key: const Key('pokemon_weight'),
                                  icon: Icons.balance,
                                  item: '${pokemon.weight} Kg',
                                  title: 'Peso',
                                ),
                                MyVerticalDivider(),
                                PokemonCardAboutInfo(
                                  key: const Key('pokemon_height'),
                                  icon: Icons.height,
                                  item: pokemon.height < 1
                                      ? '${pokemon.height * 100} cm'
                                      : '${pokemon.height} m',
                                  title: 'Altura',
                                ),
                                MyVerticalDivider(),
                                PokemonCardAboutAbility(
                                  key: const Key('pokemon_skills'),
                                  title: 'Habilidades',
                                  abilitys: pokemon.abilities,
                                ),
                              ],
                            ),
                          ),

                          const SizedBox(height: 16),

                          // Stats
                          PokemonStats(pokemon: pokemon)
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Container(
                  height: 200,
                  // width: 130,
                  margin: const EdgeInsets.only(
                    bottom: 240,
                  ),
                  // color: Colors.amber,
                  child: Hero(
                    tag: Key('img-${pokemon.id}'),
                    child: Image.network(
                      viewShiny.value ? pokemon.imageShiny : pokemon.image,
                      fit: BoxFit.cover,
                      loadingBuilder: (context, child, progress) {
                        if (progress == null) return child;
                        return Center(
                          child: Lottie.asset(
                            'assets/loading.json',
                            height: 30,
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Container(
                  margin: const EdgeInsets.only(
                    bottom: 20,
                    right: 20,
                  ),
                  width: 80,
                  child: Material(
                    elevation: 3,
                    borderRadius: BorderRadius.circular(5),
                    child: InkWell(
                      key: const Key('shiny_button'),
                      onTap: () {
                        viewShiny.value = !viewShiny.value;
                      },
                      borderRadius: BorderRadius.circular(5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Icon(
                            viewShiny.value ? Icons.star : Icons.star_border,
                            color: Colors.yellowAccent.shade700,
                            size: 32,
                          ),
                          const SizedBox(width: 8),
                          const Text(
                            'Shiny',
                            style: TextStyle(
                              fontSize: 10,
                            ),
                          ),
                          const SizedBox(width: 8),
                        ],
                      ),
                    ),
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

import 'package:flutter/material.dart';
import 'package:pokedex/controllers/pokemon_controller.dart';
import 'package:pokedex/widgets/loading_grid.dart';
import 'package:pokedex/widgets/pokemon_grid.dart';
import 'package:pokedex/widgets/pokemon_home_header.dart';
import 'package:pokedex/widgets/pokemon_not_found.dart';
import 'package:pokedex/widgets/pokemon_search_bar.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const PokemonHomeHeader(),
                const SizedBox(height: 16),
                Consumer<PokemonController>(
                  builder: (context, controller, child) {
                    return PokemonSearchBar(
                      controller.onChange,
                      key: const Key('pokemon_search_field'),
                    );
                  },
                ),
                const SizedBox(height: 16),
                Consumer<PokemonController>(
                  builder: (context, controller, child) {
                    final pokemons = controller.pokemons();
                    if (pokemons.isEmpty) {
                      if (controller.isFetchingMore()) {
                        return const LoadingGrid();
                      } else {
                        return controller.term.trim().isNotEmpty
                            ? PokemonNotFound(
                                controller: controller,
                              )
                            : const LoadingGrid();
                      }
                    } else {
                      return const PokemonGrid();
                    }
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

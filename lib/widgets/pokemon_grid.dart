import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:pokedex/controllers/pokemon_controller.dart';
import 'package:pokedex/widgets/my_custom_loading.dart';
import 'package:pokedex/widgets/pokemon_card.dart';
import 'package:provider/provider.dart';

class PokemonGrid extends HookWidget {
  const PokemonGrid({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = Provider.of<PokemonController>(context, listen: false);
    final scrollController = useScrollController();
    final percentage = useState(0.0);

    _fetch() {
      percentage.value = ((scrollController.offset * 100) /
          scrollController.position.maxScrollExtent);

      if (percentage.value > 79) {
        if (!controller.isFetchingMore()) {
          controller.fetchMore();
        }
      }
    }

    useEffect(() {
      scrollController.addListener(_fetch);
      return () => scrollController.removeListener(_fetch);
    }, [scrollController]);

    return Consumer<PokemonController>(
      builder: (context, controller, child) {
        var pokemons = controller.pokemons();
        return Stack(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.82,
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                ),
                controller: scrollController,
                itemCount: pokemons.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(2),
                    child: PokemonCard(
                      key: Key('pokemoncard-${pokemons[index].id}'),
                      pokemon: pokemons[index],
                    ),
                  );
                },
              ),
            ),
            Visibility(
              visible: percentage.value > 95 && controller.isFetchingMore(),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 500),
                color: Colors.white.withOpacity(0.3),
                height: MediaQuery.of(context).size.height * 0.82,
                child: const Center(
                  child: MyCustomLoading(
                    text: 'Carregando Novos Pokemons ...',
                    elevated: true,
                  ),
                ),
              ),
            )
          ],
        );
      },
    );
  }
}

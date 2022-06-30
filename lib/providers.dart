import 'package:pokedex/controllers/pokemon_controller.dart';
import 'package:pokedex/repositories/pokemon_repository.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

final List<SingleChildWidget> providers = [
  Provider<PokemonRepository>(
    create: (context) => PokemonRepository(),
  ),
  ChangeNotifierProvider<PokemonController>(
    create: (context) => PokemonController(
      pokemonRepository: context.read(),
    ),
  ),
];

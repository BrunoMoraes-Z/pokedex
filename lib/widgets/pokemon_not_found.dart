import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:pokedex/controllers/pokemon_controller.dart';

class PokemonNotFound extends StatelessWidget {
  const PokemonNotFound({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final PokemonController controller;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      key: const Key('error_not_found'),
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.82,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset(
            'assets/error.json',
            height: 60,
          ),
          Text.rich(
            TextSpan(
              text: 'Nenhum pokemon encontrado pela busca\n',
              children: [
                TextSpan(
                  text: '\'${controller.term}\'',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

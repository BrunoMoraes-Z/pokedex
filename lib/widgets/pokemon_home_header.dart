import 'package:flutter/material.dart';

class PokemonHomeHeader extends StatelessWidget {
  const PokemonHomeHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Image.asset(
          'assets/pokeball.png',
          height: 32,
        ),
        const SizedBox(width: 16),
        const Text(
          'Pokédex',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        const Spacer(),
        Image.asset(
          'assets/arrow_down.png',
        )
      ],
    );
  }
}

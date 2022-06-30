import 'package:flutter/material.dart';

class PokemonCardAboutInfo extends StatelessWidget {
  const PokemonCardAboutInfo({
    Key? key,
    required this.icon,
    required this.item,
    required this.title,
  }) : super(key: key);

  final IconData icon;
  final String item;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Spacer(),
          Row(
            children: [
              Icon(icon),
              const SizedBox(width: 8),
              Text(item),
            ],
          ),
          const Spacer(),
          Text(title),
          const SizedBox(height: 8),
        ],
      ),
    );
  }
}

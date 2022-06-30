import 'package:flutter/material.dart';

class PokemonCardAboutAbility extends StatelessWidget {
  const PokemonCardAboutAbility({
    Key? key,
    required this.title,
    required this.abilitys,
  }) : super(key: key);

  final String title;
  final List<String> abilitys;

  @override
  Widget build(BuildContext context) {
    if (abilitys.length > 3) {
      var temp = List.of(abilitys);
      abilitys.clear();
      abilitys.addAll(
        temp.sublist(0, temp.length),
      );
    }

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Spacer(flex: 2),
          ...abilitys
              .map(
                (e) => Text(
                  e,
                  style: const TextStyle(
                    fontSize: 10,
                  ),
                ),
              )
              .toList(),
          const Spacer(),
          Text(title),
          const SizedBox(height: 8),
        ],
      ),
    );
  }
}

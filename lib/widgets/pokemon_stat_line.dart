import 'package:flutter/material.dart';

class PokemonStatLine extends StatelessWidget {
  const PokemonStatLine({
    Key? key,
    required this.stat,
    required this.amount,
    required this.color,
  }) : super(key: key);

  final String stat;
  final int amount;
  final Color color;

  @override
  Widget build(BuildContext context) {
    var value = '$amount'.padLeft(3, '0');
    return Container(
      height: 15,
      margin: const EdgeInsets.only(left: 16, right: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            stat,
            textAlign: TextAlign.left,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: color,
              fontSize: 13,
            ),
          ),
          const Spacer(),
          Text(
            value,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 12,
            ),
          ),
          const SizedBox(width: 12),
          Stack(
            children: [
              Container(
                height: 4.5,
                margin: const EdgeInsets.only(top: 2),
                width:
                    MediaQuery.of(context).size.width * ((amount * 0.65) / 200),
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              Container(
                height: 4.5,
                margin: const EdgeInsets.only(top: 2),
                width: MediaQuery.of(context).size.width * 0.65,
                decoration: BoxDecoration(
                  color: color.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

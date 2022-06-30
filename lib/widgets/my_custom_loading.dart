import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class MyCustomLoading extends StatelessWidget {
  const MyCustomLoading({
    Key? key,
    required this.text,
    this.elevated = false,
  }) : super(key: key);

  final String text;
  final bool elevated;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Lottie.asset(
          'assets/loading.json',
          height: 60,
        ),
        const SizedBox(height: 32),
        Material(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(9),
          elevation: elevated ? 3 : 0,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            child: Text(
              text,
              style: const TextStyle(
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        )
      ],
    );
  }
}

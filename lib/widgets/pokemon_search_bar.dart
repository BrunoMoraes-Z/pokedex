import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:pokedex/shared/app_styles.dart';

class PokemonSearchBar extends HookWidget {
  const PokemonSearchBar(
    this.onChange, {
    Key? key,
  }) : super(key: key);

  final Function(String) onChange;

  @override
  Widget build(BuildContext context) {
    final controller = useTextEditingController();
    return Container(
      height: 30,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          // InkWell(
          //   onTap: () {
          //     FocusScope.of(context).unfocus();
          //   },
          //   borderRadius: const BorderRadius.only(
          //     topLeft: Radius.circular(8),
          //     bottomLeft: Radius.circular(8),
          //   ),
          //   child: Container(
          //     padding: const EdgeInsets.only(
          //       left: 10,
          //       top: 10,
          //       bottom: 10,
          //       right: 10,
          //     ),
          //     child: Image.asset(
          //       'assets/search.png',
          //     ),
          //   ),
          // ),
          // Container(
          //   decoration: const BoxDecoration(
          //     border: Border.fromBorderSide(
          //       BorderSide(
          //         color: Colors.black,
          //         width: 0.1,
          //       ),
          //     ),
          //   ),
          // ),
          const SizedBox(width: 8),
          Expanded(
            child: TextField(
              maxLines: 1,
              controller: controller,
              decoration: InputDecoration.collapsed(
                hintText: 'Procurar',
                border: InputBorder.none,
                hintStyle: TextStyle(
                  color: GrayScale.medium,
                  fontSize: 12,
                ),
              ),
              autocorrect: false,
              enableSuggestions: false,
              // autofocus: true,
              keyboardType: TextInputType.visiblePassword,
              onChanged: onChange,
            ),
          ),
          const SizedBox(width: 8),
          Container(
            decoration: const BoxDecoration(
              border: Border.fromBorderSide(
                BorderSide(
                  color: Colors.black,
                  width: 0.1,
                ),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              controller.text = '';
              onChange('');
            },
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(8),
              bottomLeft: Radius.circular(8),
            ),
            child: Container(
              padding: const EdgeInsets.only(
                left: 4,
                // top: 10,
                // bottom: 10,
                right: 4,
              ),
              child: const Icon(Icons.close, size: 16),
            ),
          ),
        ],
      ),
    );
  }
}

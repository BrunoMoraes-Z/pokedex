import 'package:flutter/material.dart';
import 'package:pokedex/widgets/my_custom_loading.dart';

class LoadingGrid extends StatelessWidget {
  const LoadingGrid({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      key: const Key('loading'),
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.82,
      child: const MyCustomLoading(
        text: 'Carregando...',
      ),
    );
  }
}

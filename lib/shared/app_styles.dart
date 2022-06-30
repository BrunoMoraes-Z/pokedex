import 'package:flutter/material.dart';

class PokeFonts {
  static Color get _fontColor => const Color(0xff333333);
  static PokeFontType get regularWhite => PokeFontType(
        fontWeight: FontWeight.w200,
        color: _fontColor,
      );
  static PokeFontType get regularDark => PokeFontType(
        fontWeight: FontWeight.w200,
        color: _fontColor,
      );
  static PokeFontType get boldWhite => PokeFontType(
        fontWeight: FontWeight.bold,
        color: _fontColor,
      );
  static PokeFontType get boldDark => PokeFontType(
        fontWeight: FontWeight.bold,
        color: _fontColor,
      );
}

class PokeFontType {
  final FontWeight fontWeight;
  final Color color;
  late TextStyle s8 = const TextStyle(
    fontSize: 8,
  );
  late TextStyle s10 = const TextStyle(
    fontSize: 10,
  );
  late TextStyle s12 = const TextStyle(
    fontSize: 12,
  );
  late TextStyle s14 = const TextStyle(
    fontSize: 14,
  );
  late TextStyle s24 = const TextStyle(
    fontSize: 24,
  );

  PokeFontType({
    required this.fontWeight,
    required this.color,
  });
}

class PokeTypeColors {
  static Color get rock => const Color(0xffB69E31);
  static Color get ghost => const Color(0xff70559b);
  static Color get steel => const Color(0xffb7b9d0);
  static Color get water => const Color(0xff6493eb);
  static Color get grass => const Color(0xff74cb48);
  static Color get psychic => const Color(0xfffb5584);
  static Color get ice => const Color(0xff9ad6df);
  static Color get dark => const Color(0xff75574c);
  static Color get fairy => const Color(0xffe69eac);
  static Color get normal => const Color(0xffaaa67f);
  static Color get fighting => const Color(0xffc12239);
  static Color get flying => const Color(0xffa891ec);
  static Color get poison => const Color(0xffa43e9e);
  static Color get ground => const Color(0xffdec16b);
  static Color get bug => const Color(0xffa7b726);
  static Color get fire => const Color(0xfff57d31);
  static Color get electric => const Color(0xfff8cf30);
  static Color get dragon => const Color(0xff7037ff);

  static Color fromName(String name) {
    name = name.toLowerCase();
    if (name == 'rock') return rock;
    if (name == 'ghost') return ghost;
    if (name == 'steel') return steel;
    if (name == 'water') return water;
    if (name == 'grass') return grass;
    if (name == 'psychic') return psychic;
    if (name == 'ice') return ice;
    if (name == 'dark') return dark;
    if (name == 'fairy') return fairy;
    if (name == 'normal') return normal;
    if (name == 'fighting') return fighting;
    if (name == 'flying') return flying;
    if (name == 'poison') return poison;
    if (name == 'ground') return ground;
    if (name == 'bug') return bug;
    if (name == 'fire') return fire;
    if (name == 'electric') return electric;
    if (name == 'dragon') return dragon;

    return normal;
  }
}

class GrayScale {
  static Color get dark => const Color(0xff212121);
  static Color get medium => const Color(0xff666666);
  static Color get light => const Color(0xffe0e0e0);
  static Color get white => Colors.white;
  static Color get background => const Color(0xfff7f7f7);
}

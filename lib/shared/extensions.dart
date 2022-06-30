extension StringExt on String {
  String toUpperFirstLetter() {
    return substring(0, 1).toUpperCase() + substring(1);
  }

  String toPortuguese() {
    var name = this;
    switch (toLowerCase()) {
      case 'grass':
        name = 'grama';
        break;
      case 'poison':
        name = 'veneno';
        break;
      case 'fire':
        name = 'fogo';
        break;
      case 'flying':
        name = 'voador';
        break;
      case 'water':
        name = 'aquático';
        break;
      case 'bug':
        name = 'inseto';
        break;
      case 'normal':
        name = 'normal';
        break;
      case 'electric':
        name = 'elétrico';
        break;
      case 'ground':
        name = 'tera';
        break;
      case 'fairy':
        name = 'fada';
        break;
      case 'fighting':
        name = 'lutador';
        break;
      case 'psychic':
        name = 'psíquico';
        break;
      case 'rock':
        name = 'pedra';
        break;
      case 'ice':
        name = 'gelo';
        break;
      case 'ghost':
        name = 'fantasma';
        break;
    }
    return name;
  }
}

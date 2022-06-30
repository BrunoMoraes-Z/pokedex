// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:http/http.dart' as http;

class Pokemon {
  late String name;
  late String url;
  late int id;

  late List<String> abilities = [];
  late List<String> types = [];
  late String image = '';
  late String imageShiny = '';
  late double weight = 0;
  late double height = 0;
  late Map<String, int> stats = {};

  Pokemon({required this.name, required this.url}) {
    if (url.endsWith('/')) {
      url = url.substring(0, url.length - 1);
    }
    id = int.tryParse(url.split('/').last) ?? -1;
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'abilities': abilities,
      'types': types,
      'image': image,
      'weight': weight,
      'height': height,
      'stats': stats,
    };
  }

  Future<Pokemon> loadInfos() async {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      var map = jsonDecode(response.body);

      if (name.isEmpty) {
        name = map['name'];
        id = map['id'];
      }

      abilities = (map['abilities'] as List)
          .map((e) => e['ability']['name'].toString())
          .toList();

      types = (map['types'] as List)
          .map((e) => e['type']['name'].toString())
          .toList();

      Map<String, int> stats = {};
      for (var element in (map['stats'] as List)) {
        stats.putIfAbsent(element['stat']['name'], () => element['base_stat']);
      }
      this.stats = stats;

      image = map['sprites']['front_default'];
      imageShiny = map['sprites']['front_shiny'];

      height = double.parse(map['height'].toString()) / 10;
      weight = double.parse(map['weight'].toString()) / 10;
    }

    return Future.value(this);
  }

  static Pokemon fromMap(Map<String, dynamic> map) {
    return Pokemon(name: map['name'], url: map['url']);
  }

  String toJson() => json.encode(toMap());

  factory Pokemon.fromJson(String source) =>
      Pokemon.fromMap(json.decode(source) as Map<String, dynamic>);
}

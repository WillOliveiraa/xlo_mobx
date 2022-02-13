class City {

  City({this.id, this.name});

  factory City.fromJson(Map<String, dynamic> json) => City(
    id: json['id'] as int,
    name: json['nome'] as String,
  );
  
  int id;
  String name;

  @override
  String toString() {
    return 'City{id: $id, name: $name}';
  }
}
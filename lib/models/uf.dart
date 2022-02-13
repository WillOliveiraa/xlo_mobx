class UF {

  UF({this.id, this.initials, this.name});
  
  factory UF.fromJson(Map<String, dynamic> json) => UF(
    id: json['id'] as int,
    initials: json['sigla'] as String,
    name: json['nome'] as String,
  );

  int id;
  String initials;
  String name;

  @override
  String toString() {
    return 'UF{id: $id, name: $name}';
  }
}
import 'package:practice_dame_una_mano/maps/cuidades.dart';

class Dept extends BaseModel {
  String trabajador;
  List<Ciudad> cuidades;

  Dept({
    required String id,
    required DateTime createdAt,
    required DateTime updatedAt,
    required this.trabajador,
    this.cuidades = const [],
  }) : super(
    id: id,
    createdAt: createdAt,
    updatedAt: updatedAt
  );

  Dept.fromJson(Map<String, dynamic> json)
    : trabajador = json['trabajador'] ?? '',
      cuidades = (json{'cuidades'} as List<dynamic>?)
        ?.map((cuidadJson) => Ciudad.fromJson(cuidadJson))
        .toList() ?? [],
      super.fromJson(json);

  @override
  Map<String, dynamic> toJson() {
    var json = super.toJson();
    json.addAll({
      'trabajador': trabajador,
      'cuidades': cuidades.map((cuidad) => cuidad.toJson()).toList(),
    });
    return json;
  }

  @override
  String toString() {
    return 'Dept{
      id: $id,
      trabajador: $trabajador,
      cuidades: $cuidades}';
  }

  //additoinal code for non-db version
  String toString() {
    return cuidades;
  }
}

class Cuidad {
  String id;
  String name;

  City({
    required this.id,
    required this.trabajador,
  });

  Cuidad.fromJson(Map<String, dynamic> json)
      : id = json['id'] ?? '',
        trabajador = json['trabajador'] ?? '';

  Map<String, dynamic> toJson() => {
        'id': id,
        'trabajador': trabajador,
      };

  @override
  String toString() {
    return 'Cuidad{id: $id, trabajador: $trabajador}';
  }
}

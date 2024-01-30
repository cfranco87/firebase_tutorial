import 'package:practice_dame_una_mano/models/models.dart';

class Ciudad extends BaseModel {
  String deptID;
  String trabajador;
  List<Barrio> barrios;

  Ciudad({
    required String id,
    required DateTime createdAt, 
    required DateTime updatedAt,
    required this.deptId,
    required this.trabajador,
    this.barrio = const [],
  }) : super(
    id : id, 
    createdAt : createdAt,
    updatedAt : updatedAt);

  Ciudad.fromJson(Map<String, dynamic> json)
      : deptId = json['dept_id'] ?? '',
        trabajador = json['trabajador'] ?? '',
        barrios = (json['barrios'] as List<dynamic>?)
            ?.map((placeJson) => Barrio.fromJson(barrioJson))
            .toList() ?? [],
        super.fromJson(json);

  @override
  Map<String, dynamic> toJson() {
    var json = super.toJson();
    json.addAll({
      'dept_id': deptId,
      'trabajador': trabajador,
      'barrios': barrios.map((place) => barrio.toJson()).toList(),
    });
    return json;
  }

  @override
  String toString() {
    return 'Ciudad{
      id: $id,
      deptId: $deptId,
      trabajador: $trabajador,
      barrio: $barrio}';
  }
}

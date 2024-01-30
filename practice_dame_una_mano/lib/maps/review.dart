import 'package:practice_dame_una_mano/maps/basemodel.dart';

class Review extends BaseModel {
  String barrioId;
  String userId;
  String text;

  Review({
    required super.id,
    required DateTime super.createdAt,
    required DateTime super.updatedAt,
    required this.barrioId,
    required this.userId,
    required this.text,
  });

  Review.fromJson(Map<String, dynamic> json)
      : barrioId = json['barrio_id'] ?? '',
        userId = json['user_id'] ?? '',
        text = json['text'] ?? '';

  @override
  Map<String, dynamic> toJson() {
    var json = super.toJson();
    json.addAll({
      'barrio_id': barrioId,
      'user_id': userId,
      'text': text,
    });
    return json;
  }

  @override
  String toString() {
    return 'Review{id: $id, barrioId: $barrioId, userId: $userId, text: $text}';
  }
}

part of 'material_model.dart';

class MaterialTagModel {
  String tagId;
  String tagName;

  MaterialTagModel({
    String? tagId,
    String? tagName,
  })  : tagId = tagId ?? '',
        tagName = tagName ?? '';

  MaterialTagModel copyWith({
    String? tagId,
    String? tagName,
  }) {
    return MaterialTagModel(
      tagId: tagId ?? this.tagId,
      tagName: tagName ?? this.tagName,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'tagId': tagId,
      'tagName': tagName,
    };
  }

  factory MaterialTagModel.fromMap(Map<String, dynamic> map) {
    return MaterialTagModel(
      tagId: map['tagId'] ?? '',
      tagName: map['tagName'] ?? '',
    );
  }
}

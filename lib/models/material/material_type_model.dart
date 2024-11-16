part of 'material_model.dart';

class MaterialTypeModel {
  final String id;
  final String typeTag;
  final String typeLg;
  final bool isInt;
  final bool x;
  final bool y;
  final bool z;

  MaterialTypeModel({
    String? id,
    String? typeLg,
    String? typeTag,
    bool? isInt,
    bool? x,
    bool? y,
    bool? z,
  }) : 
  id = id ?? '',
  typeLg = typeLg ?? '',
  typeTag = typeTag ?? '',
  isInt = isInt ?? false,
  x = x ?? true,
  y = y ?? false,
  z = z ?? false;

  MaterialTypeModel copyWith({
    String? id,
    String? typeLg,
    String? typeTag,
    bool? isInt,
    bool? x,
    bool? y,
    bool? z,
  }) {
    return MaterialTypeModel(
      id: id ?? this.id,
      typeLg: typeLg ?? this.typeLg,
      typeTag: typeTag ?? this.typeTag,
      isInt: isInt ?? this.isInt,
      x: x ?? this.x,
      y: y ?? this.y,
      z: z ?? this.z,
    );
  }

  // Convert object to Map
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'typeLg': typeLg,
      'typeTag': typeTag,
      'isInt': isInt,
      'x': x,
      'y': y,
      'z': z,
    };
  }

  // Create object from Map
  factory MaterialTypeModel.fromMap(Map<String, dynamic> map) {
    return MaterialTypeModel(
      id: map['id'] ?? '',
      typeLg: map['typeLg'] ?? '',
      typeTag: map['typeTag'] ?? '',
      isInt: map['isInt'] ?? false,
      x: map['x'] ?? true,
      y: map['y'] ?? false,
      z: map['z'] ?? false,
    );
  }
}

part of 'proyek_model.dart';

class MaterialProyekModel {
  final String materialName;
  final MaterialModel materialBase;
  final int materialX;
  final int materialY;
  final int materialZ;
  final String materialNote;
  final String materialFloor;
  final String materialRoom;
  final int materialBias;
  final int materialMultiplier;

  MaterialProyekModel({
    required this.materialName,
    required this.materialBase,
    required this.materialX,
    required this.materialY,
    required this.materialZ,
    required this.materialNote,
    required this.materialFloor,
    required this.materialRoom,
    required this.materialBias,
    required this.materialMultiplier,
  }) {
    materialBase.addListener(() {});
  }

  MaterialProyekModel copyWith({
    String? materialName,
    MaterialModel? materialBase,
    int? materialX,
    int? materialY,
    int? materialZ,
    String? materialNote,
    String? materialFloor,
    String? materialRoom,
    int? materialBias,
    int? materialMultiplier,
  }) {
    return MaterialProyekModel(
      materialName: materialName ?? this.materialName,
      materialBase: materialBase ?? this.materialBase,
      materialX: materialX ?? this.materialX,
      materialY: materialY ?? this.materialY,
      materialZ: materialZ ?? this.materialZ,
      materialNote: materialNote ?? this.materialNote,
      materialFloor: materialFloor ?? this.materialFloor,
      materialRoom: materialRoom ?? this.materialRoom,
      materialBias: materialBias ?? this.materialBias,
      materialMultiplier: materialMultiplier ?? this.materialMultiplier,
    );
  }

  // Convert object to Map
  Map<String, dynamic> toMap() {
    return {
      'materialName': materialName,
      'materialBase': materialBase.toMap(),
      'materialX': materialX,
      'materialY': materialY,
      'materialZ': materialZ,
      'materialNote': materialNote,
      'materialFloor': materialFloor,
      'materialRoom': materialRoom,
      'materialBias': materialBias,
      'materialMultiplier': materialMultiplier,
    };
  }

  // Create object from Map
  factory MaterialProyekModel.fromMap(Map<String, dynamic> map) {
    return MaterialProyekModel(
      materialName: map['materialName'] ?? '',
      materialBase: MaterialModel.fromMap(map['materialBase'] ?? {}),
      materialX: map['materialX'] ?? 0,
      materialY: map['materialY'] ?? 0,
      materialZ: map['materialZ'] ?? 0,
      materialNote: map['materialNote'] ?? '',
      materialFloor: map['materialFloor'] ?? '',
      materialRoom: map['materialRoom'] ?? '',
      materialBias: map['materialBias'] ?? 0,
      materialMultiplier: map['materialMultiplier'] ?? 0,
    );
  }
}

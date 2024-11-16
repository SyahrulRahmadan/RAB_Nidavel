import 'package:flutter/foundation.dart';
part 'material_scheme_model.dart';
part 'material_type_model.dart';
part 'material_tag_model.dart';

class MaterialModel extends ChangeNotifier {
  String materialId; // Firebase ID
  String materialName;
  MaterialTagModel materialTag; // Job tag
  MaterialTypeModel materialType; // Type (length, area, etc.)
  int rabPrice; // RAB price
  int rapPrice; // RAP price

  MaterialModel({
    String? materialId,
    String? materialName,
    MaterialTagModel? materialTag,
    MaterialTypeModel? materialType,
    int? rabPrice,
    int? rapPrice,
  })  : materialId = materialId ?? '',
        materialName = materialName ?? '',
        materialTag = materialTag ?? MaterialTagModel(),
        materialType = materialType ?? MaterialTypeModel(),
        rabPrice = rabPrice ?? 0,
        rapPrice = rapPrice ?? 0;

  // Copy with method for immutability
  MaterialModel copyWith({
    String? materialId,
    String? materialName,
    MaterialTagModel? materialTag,
    MaterialTypeModel? materialType,
    int? rabPrice,
    int? rapPrice,
  }) {
    return MaterialModel(
      materialId: materialId ?? this.materialId,
      materialName: materialName ?? this.materialName,
      materialTag: materialTag ?? this.materialTag,
      materialType: materialType ?? this.materialType,
      rabPrice: rabPrice ?? this.rabPrice,
      rapPrice: rapPrice ?? this.rapPrice,
    );
  }

  // Convert object to Map
  Map<String, dynamic> toMap() {
    return {
      'materialId': materialId,
      'materialName': materialName,
      'materialTag': materialTag.toMap(),
      'materialType': materialType.toMap(), // Assuming MaterialTypeModel has toMap()
      'rabPrice': rabPrice,
      'rapPrice': rapPrice,
    };
  }

  // Create object from Map
  factory MaterialModel.fromMap(Map<String, dynamic> map) {
    return MaterialModel(
      materialId: map['materialId'] ?? '',
      materialName: map['materialName'] ?? '',
      materialTag: MaterialTagModel.fromMap(map['materialTag'] ?? {}),
      materialType: MaterialTypeModel.fromMap(map['materialType'] ?? {}), // Assuming MaterialTypeModel has fromMap()
      rabPrice: map['rabPrice'] ?? 0,
      rapPrice: map['rapPrice'] ?? 0,
    );
  }

  // Notify listeners when a change is made (optional)
  void updateMaterial(String newName, MaterialTagModel newTag, MaterialTypeModel newType, int newRabPrice, int newRapPrice) {
    if (materialName != newName) {
      materialName = newName;
      notifyListeners();
    }
    if (materialTag != newTag) {
      materialTag = newTag;
      notifyListeners();
    }
    if (materialType != newType) {
      materialType = newType;
      notifyListeners();
    }
    if (rabPrice != newRabPrice) {
      rabPrice = newRabPrice;
      notifyListeners();
    }
    if (rapPrice != newRapPrice) {
      rapPrice = newRapPrice;
      notifyListeners();
    }
  }
}

part of 'material_model.dart';

class MaterialSchemeModel extends ChangeNotifier {
  String schemeId; // Firebase ID
  String schemeName; // Scheme name
  String schemeDescription; // Scheme description
  List<MaterialModel> schemeMaterials; // Scheme materials

  MaterialSchemeModel({
    String? schemeId,
    String? schemeName,
    String? schemeDescription,
    List<MaterialModel>? schemeMaterials,
  })  : schemeId = schemeId ?? '',
        schemeName = schemeName ?? '',
        schemeDescription = schemeDescription ?? '',
        schemeMaterials = schemeMaterials ?? [];

  // Copy with method for immutability
  MaterialSchemeModel copyWith({
    String? schemeId,
    String? schemeName,
    String? schemeDescription,
    List<MaterialModel>? schemeMaterials,
  }) {
    return MaterialSchemeModel(
      schemeId: schemeId ?? this.schemeId,
      schemeName: schemeName ?? this.schemeName,
      schemeDescription: schemeDescription ?? this.schemeDescription,
      schemeMaterials: schemeMaterials ?? this.schemeMaterials,
    );
  }

  // Convert object to Map
  Map<String, dynamic> toMap() {
    return {
      'schemeId': schemeId,
      'schemeName': schemeName,
      'schemeDescription': schemeDescription,
      'schemeMaterials': schemeMaterials.map((x) => x.toMap()).toList(),
    };
  }

  // Create object from Map
  factory MaterialSchemeModel.fromMap(Map<String, dynamic> map) {
    return MaterialSchemeModel(
      schemeId: map['schemeId'] ?? '',
      schemeName: map['schemeName'] ?? '',
      schemeDescription: map['schemeDescription'] ?? '',
      schemeMaterials: map['schemeMaterials'] != null
          ? List<MaterialModel>.from(
              map['schemeMaterials'].map((x) => MaterialModel.fromMap(x)))
          : [],
    );
  }
}


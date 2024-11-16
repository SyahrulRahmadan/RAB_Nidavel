import 'package:nidavel/models/material/material_model.dart'; 
part 'proyek_material_model.dart';

class ProyekModel {
  final String proyekId;
  final String proyekName;
  final DateTime proyekDate;
  final int proyekInternalValue;
  final int proyekExternalValue;
  final int profitLoss;
  final String proyekClientName;
  final MaterialSchemeModel proyekScheme;
  final List<MaterialProyekModel> proyekMaterial;

  ProyekModel({
    required this.proyekId,
    required this.proyekName,
    required this.proyekDate,
    required this.proyekInternalValue,
    required this.proyekExternalValue,
    required this.profitLoss,
    required this.proyekClientName,
    required this.proyekScheme,
    required this.proyekMaterial,
  });

  ProyekModel copyWith({
    String? proyekId,
    String? proyekName,
    DateTime? proyekDate,
    int? proyekInternalValue,
    int? proyekExternalValue,
    int? profitLoss,
    String? proyekClientName,
    MaterialSchemeModel? proyekScheme,
    List<MaterialProyekModel>? proyekMaterial,
  }) {
    return ProyekModel(
      proyekId: proyekId ?? this.proyekId,
      proyekName: proyekName ?? this.proyekName,
      proyekDate: proyekDate ?? this.proyekDate,
      proyekInternalValue: proyekInternalValue ?? this.proyekInternalValue,
      proyekExternalValue: proyekExternalValue ?? this.proyekExternalValue,
      profitLoss: profitLoss ?? this.profitLoss,
      proyekClientName: proyekClientName ?? this.proyekClientName,
      proyekScheme: proyekScheme ?? this.proyekScheme,
      proyekMaterial: proyekMaterial ?? this.proyekMaterial,
    );
  }

  // Convert object to Map
  Map<String, dynamic> toMap() {
    return {
      'proyekId': proyekId,
      'proyekName': proyekName,
      'proyekDate': proyekDate.toIso8601String(),
      'proyekInternalValue': proyekInternalValue,
      'proyekExternalValue': proyekExternalValue,
      'profitLoss': profitLoss,
      'proyekClientName': proyekClientName,
      'proyekScheme': proyekScheme.toMap(),
      'proyekMaterial': proyekMaterial.map((material) => material.toMap()).toList(),
    };
  }

  // Create object from Map
  factory ProyekModel.fromMap(Map<String, dynamic> map) {
    return ProyekModel(
      proyekId: map['proyekId'] ?? '',
      proyekName: map['proyekName'] ?? '',
      proyekDate: DateTime.parse(map['proyekDate']),
      proyekInternalValue: map['proyekInternalValue'] ?? 0,
      proyekExternalValue: map['proyekExternalValue'] ?? 0,
      profitLoss: map['profitLoss'] ?? 0,
      proyekClientName: map['proyekClientName'] ?? '',
      proyekScheme: MaterialSchemeModel.fromMap(map['proyekScheme']),
      proyekMaterial: List<MaterialProyekModel>.from(
        (map['proyekMaterial'] as List).map((item) => MaterialProyekModel.fromMap(item))
      ),
    );
  }
}

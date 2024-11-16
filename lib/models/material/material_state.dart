part of 'material_bloc.dart';

abstract class MaterialState extends Equatable {
  const MaterialState();
  
  @override
  List<Object> get props => [];
}

class MaterialInitial extends MaterialState {}

class MaterialLoading extends MaterialState {}

class MaterialLoaded extends MaterialState {
  final List<MaterialSchemeModel> materialSchemes;
  final List<MaterialTypeModel> materialTypes;
  final List<MaterialTagModel> materialTag;

  const MaterialLoaded({
    required this.materialSchemes,
    required this.materialTypes,
    required this.materialTag,
  });

  @override
  List<Object> get props => [materialSchemes, materialTypes, materialTag];
}

class MaterialError extends MaterialState {
  final String e;

  const MaterialError(this.e);

  @override
  List<Object> get props => [e];
}



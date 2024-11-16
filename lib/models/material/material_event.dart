part of 'material_bloc.dart';

abstract class MaterialEvent extends Equatable {
  const MaterialEvent();

  @override
  List<Object> get props => [];
}

class MaterialEventLoad extends MaterialEvent {}


// =======================================  Material Handler  ======================================================
class MaterialSchemeEventCreation extends MaterialEvent {
  final MaterialSchemeModel newScheme;

  const MaterialSchemeEventCreation({required this.newScheme});

  @override
  List<Object> get props => [newScheme];
}

class MaterialEventCreation extends MaterialEvent {
  final int scheme;
  final MaterialModel newMaterial;

  const MaterialEventCreation({required this.scheme, required this.newMaterial});

  @override
  List<Object> get props => [scheme, newMaterial];
}

class MaterialSchemeEventDuplicate extends MaterialEvent{
  final int index;

  const MaterialSchemeEventDuplicate({required this.index});

  @override
  List<Object> get props => [index];
}

class MaterialSchemeEventUpdate extends MaterialEvent {
  final int index;
  final String newName;
  final String newDescription;

  const MaterialSchemeEventUpdate({
    required this.index, 
    required this.newName, 
    required this.newDescription
  });

  @override
  List<Object> get props => [index, newName, newDescription];
}

class MaterialEventUpdate extends MaterialEvent {
  final int scheme;
  final int index;
  final String newName;
  final MaterialTagModel newTag;
  final MaterialTypeModel newType;
  final int newRapPrice;
  final int newRabPrice;

  const MaterialEventUpdate({
    required this.scheme, 
    required this.index, 
    required this.newName, 
    required this.newRapPrice,
    required this.newRabPrice, 
    required this.newTag, 
    required this.newType
  });

  @override
  List<Object> get props => [index, scheme, newName, newRapPrice, newRabPrice, newTag, newType];
}

class MaterialSchemeEventDelete extends MaterialEvent {
  final int index;

  const MaterialSchemeEventDelete({required this.index});

  @override
  List<Object> get props => [index];
}

class MaterialEventDelete extends MaterialEvent {
  final int scheme;
  final int index;

  const MaterialEventDelete({required this.index, required this.scheme});

  @override
  List<Object> get props => [scheme, index];
}


//=======================================  Type Handler  ======================================================
class TypeEventCreation extends MaterialEvent {
  final MaterialTypeModel typeCreate;

  const TypeEventCreation({required this.typeCreate});

  @override
  List<Object> get props => [typeCreate];
}

class TypeXEventToggle extends MaterialEvent {
  final int number;
  final bool newValue;

  const TypeXEventToggle({required this.number, required this.newValue});

  @override
  List<Object> get props => [number, newValue];
}

class TypeYEventToggle extends MaterialEvent {
  final int number;
  final bool newValue;

  const TypeYEventToggle({required this.number, required this.newValue});

  @override
  List<Object> get props => [number, newValue];
}

class TypeZEventToggle extends MaterialEvent {
  final int number;
  final bool newValue;

  const TypeZEventToggle({required this.number, required this.newValue});

  @override
  List<Object> get props => [number, newValue];
}

class TypeIntEventToggle extends MaterialEvent {
  final int number;
  final bool newValue;

  const TypeIntEventToggle({required this.number, required this.newValue});

  @override
  List<Object> get props => [number, newValue];
}

class TypeEventUpdate extends MaterialEvent {
  final int number;
  final String newTag;
  final String newLg;

  const TypeEventUpdate({required this.number ,required this.newLg, required this.newTag});

  @override
  List<Object> get props => [number, newLg, newTag];
}

class TypeEventDelete extends MaterialEvent {
  final int number;

  const TypeEventDelete({required this.number});

  @override
  List<Object> get props => [number];
}


// ============================  Tag Handler  ======================================
class TagEventCreation extends MaterialEvent {
  final MaterialTagModel tagCreate;

  const TagEventCreation({required this.tagCreate});

  @override
  List<Object> get props => [tagCreate];
}

class TagEventUpdate extends MaterialEvent {
  final int number;
  final String tag;

  const TagEventUpdate({required this.number, required this.tag});

  @override 
  List<Object> get props => [number, tag];
}

class TagEventDelete extends MaterialEvent {
  final int number;

  const TagEventDelete({required this.number});
  
  @override
  List<Object> get props => [number];
}
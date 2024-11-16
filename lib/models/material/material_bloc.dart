import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'material_model.dart';

part 'material_event.dart';
part 'material_state.dart';

class MaterialBloc extends Bloc<MaterialEvent, MaterialState> {
  List<MaterialSchemeModel> materialSchemes = [];
  List<MaterialTypeModel> materialTypes = [];
  List<MaterialTagModel> materialTag = [];

  MaterialBloc() : super(MaterialInitial()) {

    //  ====  Get All  =======
    on<MaterialEventLoad>((event, emit) async {
      emit(MaterialLoading());
      try {
        // Simulate loading data from API
        await Future.delayed(const Duration(seconds: 2));
        emit(MaterialLoaded(materialSchemes: materialSchemes, materialTypes: materialTypes, materialTag: materialTag));
      } catch (e) {
        emit(MaterialError(e.toString()));
      }
    });

    // ====  Template  ====
    on<MaterialEvent>((event, emit) {});


    // =============================================   Material Scheme Model Bloc  ======================================================

    // ===  Create  ===
    on<MaterialSchemeEventCreation>((event, emit) {
      List<MaterialSchemeModel> updatedSchemes = List.from(materialSchemes);
      updatedSchemes.add(event.newScheme);
      materialSchemes = updatedSchemes;
      // implement creation in database
      emit(MaterialLoaded(materialSchemes: updatedSchemes, materialTypes: materialTypes, materialTag: materialTag));
    });

    on<MaterialEventCreation>((event, emit) {
      List<MaterialSchemeModel> updatedSchemes = List.from(materialSchemes);
      List<MaterialModel> updatedModels = List.from(updatedSchemes[event.scheme].schemeMaterials);
      updatedModels.add(event.newMaterial);
      updatedSchemes[event.scheme] = updatedSchemes[event.scheme].copyWith(schemeMaterials: updatedModels);
      materialSchemes = updatedSchemes;
      // implement creation in database
      emit(MaterialLoaded(materialSchemes: updatedSchemes, materialTypes: materialTypes, materialTag: materialTag));
    });

    on<MaterialSchemeEventDuplicate>((event, emit) {
      List<MaterialSchemeModel> updatedSchemes = List.from(materialSchemes);
      updatedSchemes.add(updatedSchemes[event.index]);
      materialSchemes = updatedSchemes;
      // implement duplication in database
      emit(MaterialLoaded(materialSchemes: updatedSchemes, materialTypes: materialTypes, materialTag: materialTag));
    });

    // ===  Update  ===
    on<MaterialSchemeEventUpdate>((event, emit) {
      List<MaterialSchemeModel> updatedSchemes = List.from(materialSchemes);
      updatedSchemes[event.index] = updatedSchemes[event.index].copyWith(
        schemeName: event.newName,
        schemeDescription: event.newDescription,
      );
      materialSchemes = updatedSchemes;
      // implement update in database
      emit(MaterialLoaded(materialSchemes: updatedSchemes, materialTypes: materialTypes, materialTag: materialTag));
    });

    on<MaterialEventUpdate>((event, emit) {
      List<MaterialSchemeModel> updatedSchemes = List.from(materialSchemes);
      List<MaterialModel> updatedModels = List.from(updatedSchemes[event.scheme].schemeMaterials);
      updatedModels[event.index] = updatedModels[event.index].copyWith(
        materialName: event.newName,
        materialTag: event.newTag,
        materialType: event.newType,
        rabPrice: event.newRapPrice,
        rapPrice: event.newRabPrice
      );
      updatedSchemes[event.scheme] = updatedSchemes[event.scheme].copyWith(
        schemeMaterials: updatedModels,
      );
      materialSchemes = updatedSchemes;
      // implement update in database
      emit(MaterialLoaded(materialSchemes: updatedSchemes, materialTypes: materialTypes, materialTag: materialTag));
    });

    // ===  Delete  ===
    on<MaterialSchemeEventDelete>((event, emit) {
      List<MaterialSchemeModel> updatedSchemes = List.from(materialSchemes);
      updatedSchemes.removeAt(event.index);
      materialSchemes = updatedSchemes;
      // implement delete in database
      emit(MaterialLoaded(materialSchemes: updatedSchemes, materialTypes: materialTypes, materialTag: materialTag));
    });

    on<MaterialEventDelete>((event, emit) {
      List<MaterialSchemeModel> updatedSchemes = List.from(materialSchemes);
      List<MaterialModel> updatedModels = List.from(updatedSchemes[event.scheme].schemeMaterials);
      updatedModels.removeAt(event.index);
      updatedSchemes[event.scheme] = updatedSchemes[event.scheme].copyWith(
        schemeMaterials: updatedModels,
      );
      // implement delete in database
      emit(MaterialLoaded(materialSchemes: updatedSchemes, materialTypes: materialTypes, materialTag: materialTag));
    });



    // ==============================================   Type Material Model Bloc  ==================================================

    // ===  Create  ===
    on<TypeEventCreation>((event, emit) {
      List<MaterialTypeModel> updatedTypes = List.from(materialTypes);
      updatedTypes.add(event.typeCreate);
      materialTypes = updatedTypes;
      // implement create in database
      emit(MaterialLoaded(materialSchemes: materialSchemes, materialTypes: updatedTypes, materialTag: materialTag));
    });

    // ===  Update  ===
    on<TypeXEventToggle>((event, emit) {
      List<MaterialTypeModel> updatedTypes = List.from(materialTypes);
      updatedTypes[event.number] = updatedTypes[event.number].copyWith(x: event.newValue);
      materialTypes = updatedTypes;
      // implement toggle in database
      emit(MaterialLoaded(materialSchemes: materialSchemes, materialTypes: updatedTypes, materialTag: materialTag));
    });
    
    on<TypeYEventToggle>((event, emit) {
      List<MaterialTypeModel> updatedTypes = List.from(materialTypes);
      updatedTypes[event.number] = updatedTypes[event.number].copyWith(y: event.newValue);
      materialTypes = updatedTypes;
      // implement toggle in database
      emit(MaterialLoaded(materialSchemes: materialSchemes, materialTypes: updatedTypes, materialTag: materialTag));
    });
    
    on<TypeZEventToggle>((event, emit) {
      List<MaterialTypeModel> updatedTypes = List.from(materialTypes);
      updatedTypes[event.number] = updatedTypes[event.number].copyWith(z: event.newValue);
      materialTypes = updatedTypes;
      // implement toggle in database
      emit(MaterialLoaded(materialSchemes: materialSchemes, materialTypes: updatedTypes, materialTag: materialTag));
    });

    on<TypeIntEventToggle>((event, emit) {
      List<MaterialTypeModel> updatedTypes = List.from(materialTypes);
      updatedTypes[event.number] = updatedTypes[event.number].copyWith(isInt: event.newValue);
      materialTypes = updatedTypes;
      // implement toggle in database
      emit(MaterialLoaded(materialSchemes: materialSchemes, materialTypes: updatedTypes, materialTag: materialTag));
    });

    on<TypeEventUpdate>((event, emit) {
      List<MaterialTypeModel> updatedTypes = List.from(materialTypes);
      updatedTypes[event.number] = updatedTypes[event.number].copyWith(typeLg: event.newLg, typeTag: event.newTag);
      materialTypes = updatedTypes;
      // implement update in database
      emit(MaterialLoaded(materialSchemes: materialSchemes, materialTypes: updatedTypes, materialTag: materialTag));
    });   

    // ===  Delete  ===
    on<TypeEventDelete>((event, emit) {
      List<MaterialTypeModel> updatedTypes = List.from(materialTypes);
      final removedType = updatedTypes.removeAt(event.number);
      materialTypes = updatedTypes;
      // implement delete in database
      emit(MaterialLoaded(materialSchemes: materialSchemes, materialTypes: updatedTypes, materialTag: materialTag));
    });


    // ================================================  Tag Material Model Bloc  ==========================================================

    // ===  Create  ===
    on<TagEventCreation>((event, emit) {
      List<MaterialTagModel> updatedTags = List.from(materialTag);
      updatedTags.add(event.tagCreate);
      materialTag = updatedTags;
      // implement push in databse
      emit(MaterialLoaded(materialSchemes: materialSchemes, materialTypes: materialTypes, materialTag: updatedTags));
    }); 

    // ===  Update  ===
    on<TagEventUpdate>((event, emit) {
      List<MaterialTagModel> updatedTags = List.from(materialTag);
      updatedTags[event.number] = updatedTags[event.number].copyWith(tagName: event.tag);
      materialTag = updatedTags;
      // implement update in database
      emit(MaterialLoaded(materialSchemes: materialSchemes, materialTypes: materialTypes, materialTag: updatedTags));
    });

    // ===  Delete  ===
    on<TagEventDelete>((event, emit) {
      List<MaterialTagModel> updatedTags = List.from(materialTag);
      final removedTags = updatedTags.removeAt(event.number);
      materialTag = updatedTags;
      // implement delete in database
      emit(MaterialLoaded(materialSchemes: materialSchemes, materialTypes: materialTypes, materialTag: materialTag));
    });
  }
}

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'proyek_model.dart';

part 'proyek_event.dart';
part 'proyek_state.dart';

class ProyekBloc extends Bloc<ProyekEvent, ProyekState> {
  List<ProyekModel> proyekan = [];

  ProyekBloc() : super(ProyekInitial()) {
    // ===== TEMPLATE =====
    on<ProyekEvent>((event, emit) {

    });


    // ===== GET =====
    on<ProyekLoadingEvent>((event, emit) {
      emit(ProyekLoading());
      // try to do something
      emit(ProyekLoaded(proyekan));
    });


    // ===== CREATION ======
    on<ProyekCreationEvent>((event, emit) {
      emit(ProyekLoading());

      List<ProyekModel> updatedProyekan = List.from(proyekan);
      updatedProyekan.add(event.proyek);
      proyekan = updatedProyekan;

      emit(ProyekLoaded(updatedProyekan));
    });
    
  }
}

part of 'proyek_bloc.dart';

abstract class ProyekEvent extends Equatable{
  @override
  List<Object?> get props => [];
}

class ProyekLoadingEvent extends ProyekEvent{}

class ProyekCreationEvent extends ProyekEvent{
  final ProyekModel proyek;

  ProyekCreationEvent(this.proyek);

  @override
  List<Object?> get props => [proyek]; 
}
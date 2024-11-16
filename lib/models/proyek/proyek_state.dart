part of 'proyek_bloc.dart';

abstract class ProyekState extends Equatable {
  @override
  List<Object?> get props => [];
}

class ProyekInitial extends ProyekState{}

class ProyekLoading extends ProyekState{}

class ProyekLoaded extends ProyekState{
  final List<ProyekModel> proyekan;

  ProyekLoaded(this.proyekan);

  @override
  List<Object?> get props => [proyekan];
}

class ProyekError extends ProyekState{
  final String e;

  ProyekError(this.e);

  @override
  List<Object?> get props => [e];
}
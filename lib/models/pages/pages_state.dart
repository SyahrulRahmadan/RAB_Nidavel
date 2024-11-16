part of 'pages_bloc.dart';

abstract class PagesState extends Equatable{
  @override
  List<Object?> get props => [];
}

class PagesInitial extends PagesState{}

class PagesLoading extends PagesState{}

class PagesLoaded extends PagesState{
  final List<PagesModel> pages;
  final int loaded;

  PagesLoaded({required this.pages, required this.loaded});

  @override
  List<Object?> get props => [pages, loaded];
}

class PagesError extends PagesState{
  final String e;

  PagesError({required this.e});

  @override
  List<Object?> get props => [e];
}


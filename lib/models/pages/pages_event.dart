part of 'pages_bloc.dart';

abstract class PagesEvent extends Equatable{
  @override
  List<Object?> get props => [];
}

class PagesLoadingEvent extends PagesEvent{}

class PagesCreatedEvent extends PagesEvent{
  final PagesModel page;

  PagesCreatedEvent({required this.page});

  @override
  List<Object?> get props => [page];
}

class PagesDeletedEvent extends PagesEvent{
  final int index;

  PagesDeletedEvent({required this.index});

  @override
  List<Object?> get props => [index];
}

// event about changing window

class ChangedProjectEvent extends PagesEvent{}

class ChangedDatabaseEvent extends PagesEvent{}

class ChangedReportEvent extends PagesEvent{}

class ChangedSettingEvent extends PagesEvent{}

class ChangedInfoEvent extends PagesEvent{}


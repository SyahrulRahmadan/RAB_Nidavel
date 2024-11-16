import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:nidavel/models/pages/pages_model.dart';
import 'package:bloc/bloc.dart';

import 'package:nidavel/pages/database/database.dart';
import 'package:nidavel/pages/proyek/proyek.dart';
import 'package:nidavel/pages/info/info.dart';
import 'package:nidavel/pages/setting/setting.dart';

part 'pages_state.dart';
part 'pages_event.dart';

class PagesBloc extends Bloc<PagesEvent, PagesState> {
  List<PagesModel> pages = [];

  List<List<PagesModel>> allPages = [
    [
      PagesModel(body: const ProyekTab(), title: 'Proyek Dashboard'),
    ],
    [
      PagesModel(body: const DatabasePage(), title: 'Database Dashboard')
    ],
    [
      PagesModel(body: const Text('Report Page'), title: 'pages 1')
    ],
    [
      PagesModel(body: const SettingPage(), title: 'Settingan')
    ],
    [
      PagesModel(body: const InfoPage(), title: 'Info')
    ]
  ];

  PagesBloc() : super(PagesInitial()) {
    on<PagesLoadingEvent>((event, emit) {
      emit(PagesLoading());
      pages = allPages[0];
      emit(PagesLoaded(pages: pages, loaded: 0));
    });

    on<PagesDeletedEvent>((event, emit) {
      final updatedPages = List<PagesModel>.from(pages);
      updatedPages.removeAt(event.index);
      pages = updatedPages;
      emit(PagesLoaded(pages: updatedPages, loaded: (state as PagesLoaded).loaded));
    });

    on<PagesCreatedEvent>((event, emit) {
      final updatedPages = List<PagesModel>.from(pages);
      updatedPages.add(event.page);
      pages = updatedPages;
      emit(PagesLoaded(pages: updatedPages, loaded: (state as PagesLoaded).loaded));
    });


    // Drawer Change using this Event
    on<ChangedProjectEvent>((event, emit) {
      allPages[(state as PagesLoaded).loaded] = pages;
      final updatedPages = List<PagesModel>.from(allPages[0]);
      pages = updatedPages;
      emit(PagesLoaded(pages: updatedPages, loaded: 0));
    });

    on<ChangedDatabaseEvent>((event, emit) {
      allPages[(state as PagesLoaded).loaded] = pages;
      final updatedPages = List<PagesModel>.from(allPages[1]);
      pages = updatedPages;
      emit(PagesLoaded(pages: updatedPages, loaded: 1));
    });

    on<ChangedReportEvent>((event, emit) {
      allPages[(state as PagesLoaded).loaded] = pages;
      final updatedPages = List<PagesModel>.from(allPages[2]);
      pages = updatedPages;
      emit(PagesLoaded(pages: updatedPages, loaded: 2));
    });

    on<ChangedSettingEvent>((event, emit) {
      allPages[(state as PagesLoaded).loaded] = pages;
      final updatedPages = List<PagesModel>.from(allPages[3]);
      pages = updatedPages;
      emit(PagesLoaded(pages: updatedPages, loaded: 3));
    });

    on<ChangedInfoEvent>((event, emit) {
      allPages[(state as PagesLoaded).loaded] = pages;
      final updatedPages = List<PagesModel>.from(allPages[4]);
      pages = updatedPages;
      emit(PagesLoaded(pages: updatedPages, loaded: 4));
    });
  }
}
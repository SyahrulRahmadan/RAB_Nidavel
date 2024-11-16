import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:nidavel/models/pages/pages.dart';
import 'package:nidavel/pages/additional/costumdrawer.dart';
import 'package:nidavel/pages/pages/pages.dart';
import 'additional/additional.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key});
  final List<GlobalKey<PagesTabfullState>> _keys = [
    GlobalKey<PagesTabfullState>(),
    GlobalKey<PagesTabfullState>(),
    GlobalKey<PagesTabfullState>(),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PagesBloc, PagesState>(
      builder: (context, state) {
        if(state is PagesLoading || state is PagesInitial){
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is PagesLoaded){
          return Scaffold(
            // appBar: AppBar(
            //   title: const Center(child: Text('Nidavel Construction Project')),
            // ),
            body: Row(
              children: [
                const CostumDrawer(),
                Expanded(
                  child: (state.loaded == 0 || state.loaded == 1 || state.loaded == 2) 
                    ? PagesTabfull(key: _keys[state.loaded], pages: state.pages) 
                    : PagesTabless(page: state.pages[0]),
                ),
              ],
            ),
          );
        }
        return const Center(
          child: Text( 'Wait a Second'),
        );
      },
    );
  }
}

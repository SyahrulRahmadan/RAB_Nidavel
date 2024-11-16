import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nidavel/models/pages/pages.dart';
import 'package:nidavel/pages/database/database.dart';

class DatabasePage extends StatelessWidget {
  const DatabasePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Navigator(
        onGenerateRoute: (settings) {
          return MaterialPageRoute(builder: (context) => 
          Container(
            margin: const EdgeInsets.all(12),
            child: ListView(
              children: [
                ListTile(
                  leading: const Icon(Icons.inventory_2_outlined),
                  title: const Text('Material'),
                  onTap: () {
                    Navigator
                    .push(
                      context, 
                      MaterialPageRoute(
                        builder: (context) => const DatabaseSchemePage()
                      )
                    );
                  },
                  hoverColor: Colors.grey,
                ),
                ListTile(
                  leading: const Icon(Icons.type_specimen),
                  title: const Text('Type'),
                  onTap: () {
                    context
                    .read<PagesBloc>()
                    .add(
                      PagesCreatedEvent(
                        page: PagesModel(
                          body: const DatabaseTypePage(), 
                          title: 'Type Database'
                        )
                      )
                    );
                  },
                  hoverColor: Colors.grey,
                ),
                ListTile(
                  leading: const Icon(Icons.tag_rounded),
                  title: const Text('Tag'),
                  onTap: () {
                    context
                    .read<PagesBloc>()
                    .add(
                      PagesCreatedEvent(
                        page: PagesModel(
                          body: const DatabaseTagPage(), 
                          title: 'Tag Database'
                        )
                      )
                    );
                  },
                  hoverColor: Colors.grey,
                ),
              ],
            ),
          ),);
        },
      ) 
    );
  }
}
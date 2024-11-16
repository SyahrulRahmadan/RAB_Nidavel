import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:nidavel/models/material/material.dart' as material;
import 'database_scheme_list.dart';
import 'database_scheme_creation.dart';

class DatabaseSchemePage extends StatelessWidget {
  const DatabaseSchemePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text('Database Scheme')
        ),
      ),
      body: Container(
        margin: const EdgeInsets.all(12),
        child: BlocBuilder<material.MaterialBloc, material.MaterialState>(
          builder: (context, state) {
            if (state is material.MaterialLoaded){
              return Column(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      showDialog(
                        context: context, 
                        builder: (context) {
                          return const DatabaseSchemeCreation();
                        } 
                      );
                    }, 
                    child: const Text(
                      'New Scheme'
                    ) 
                  ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const Expanded(
                          flex: 3,
                          child: Center(
                            child: Text(
                              'Scheme Name'
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Container(),
                        ),
                        const Expanded(
                          flex: 1,
                          child: Center(
                            child: Text(
                              'Action'
                            ),
                          ),
                        ),
                      ],
                    ), 
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: state.materialSchemes.length,
                      itemBuilder: (BuildContext contex, index) {
                        return DatabaseSchemeList(number: index, schemeModel : state.materialSchemes[index]);
                      }, 
                    )
                  )
                ],
              );
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}
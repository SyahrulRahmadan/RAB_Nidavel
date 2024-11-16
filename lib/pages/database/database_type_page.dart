import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:nidavel/models/material/material.dart' as material;
import 'database_type_creation.dart';
import 'database_type_list.dart';

class DatabaseTypePage extends StatelessWidget {
  const DatabaseTypePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:  const EdgeInsets.all(12),
      height: double.infinity,
      child: BlocBuilder<material.MaterialBloc, material.MaterialState>(
        builder: (context, state) {
          if (state is material.MaterialLoaded){
            return Column(
              children: [
                ElevatedButton(
                  onPressed: () {
                    showDialog(
                      context: context, 
                      builder: (BuildContext context) {
                        return const DatabaseTypeCreation();
                      }
                    );
                  }, 
                  child: const Text("New Type")
                ),
                Container(
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Expanded(
                        flex: 5,
                        child: Center(
                          child: Text(
                            'Type Tag',
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: Center(
                          child: Text(
                            'Label',
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Center(
                          child: Text(
                            'X',
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Center(
                          child: Text(
                            'Y',
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Center(
                          child: Text(
                            'Z',
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Center(
                          child: Text(
                            'INT',
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 4,
                        child: Center(
                          child: Text(
                                'Action',
                              ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: state.materialTypes.length,
                    itemBuilder: (BuildContext context, int index) {
                      return DatabaseTypeList(typeModel: state.materialTypes[index], number: index,);
                    },
                  ),
                ),
              ],
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      )
    );
  }
}
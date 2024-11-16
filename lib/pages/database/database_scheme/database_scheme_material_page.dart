import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:nidavel/models/material/material.dart' as material;
import 'database_scheme_material_creation.dart';
import 'database_scheme_material_list.dart';

class DatabaseSchemeMaterialPage extends StatelessWidget {
  const DatabaseSchemeMaterialPage({super.key, required this.number});
  final int number;

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
                        return DatabaseSchemeMaterialCreation(scheme: number);
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
                        flex: 2,
                        child: Center(
                          child: Text(
                            'Material Name',
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: Center(
                          child: Text(
                            'Material Type',
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: Center(
                          child: Text(
                            'Material Tag',
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Center(
                          child: Text(
                            'RAB Price',
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Center(
                          child: Text(
                            'RAB Price',
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 2,
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
                    itemCount: state.materialSchemes[number].schemeMaterials.length,
                    itemBuilder: (BuildContext context, int index) {
                      return DatabaseSchemeMaterialList(scheme: number, number: index, materialModel: state.materialSchemes[number].schemeMaterials[index],);
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
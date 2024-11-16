import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:nidavel/models/material/material.dart' as material;
import 'database_tag_creation.dart';
import 'database_tag_list.dart';

class DatabaseTagPage extends StatelessWidget {
  const DatabaseTagPage({super.key});

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
                        return const DatabaseTagCreation();
                      }
                    );
                  }, 
                  child: const Text("New Type")
                ),

                // ===== HEADER =====
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const Expanded(
                        flex: 6,
                        child: Center(
                          child: Text(
                            'Type Tag',
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: Container(),
                      ),
                      const Expanded(
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
                    itemCount: state.materialTag.length,
                    itemBuilder: (BuildContext context, int index) {
                      return DatabaseTagList(tagModel: state.materialTag[index], number: index,);
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
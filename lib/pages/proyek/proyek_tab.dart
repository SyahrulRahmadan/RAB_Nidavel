import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:nidavel/models/proyek/proyek.dart';

import 'proyek_tab_creation.dart';
import 'proyek_tab_list.dart';

class ProyekTab extends StatelessWidget {
  const ProyekTab({super.key});

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
        child: BlocBuilder<ProyekBloc, ProyekState>(
          builder: (context, state) {
            if (state is ProyekLoaded){
              return Column(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      showDialog(
                        context: context, 
                        builder: (context) {
                          return const ProyekTabCreation();
                        } 
                      );
                    }, 
                    child: const Text(
                        'New Project'
                      ),
                  ),
                  Container(
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Expanded(
                          flex: 2,
                          child: Center(
                            child: Text(
                              'Project Name'
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Center(
                            child: Text(
                              'Project Date'
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: Center(
                            child: Text(
                              'Internal Valuation'
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: Center(
                            child: Text(
                              'External Valuation'
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Center(
                            child: Text(
                              'Profit/Loss'
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Center(
                            child: Text(
                              'Client Name'
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Center(
                            child: Text(
                              'Project Creator'
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 2,
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
                      itemCount: state.proyekan.length,
                      itemBuilder: (BuildContext contex, index) {
                        return ProyekTabList(number: index, proyek: state.proyekan[index],);
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
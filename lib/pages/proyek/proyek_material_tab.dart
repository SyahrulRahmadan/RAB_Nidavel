import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nidavel/models/proyek/proyek.dart';

class ProyekMainTab extends StatelessWidget {
  const ProyekMainTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: BlocBuilder<ProyekBloc, ProyekState>(
        builder: (context, state) {
          if (state is ProyekInitial || state is ProyekLoading){
            return const Center(
              child: CircularProgressIndicator(),
            );
          }else if (state is ProyekError){
            return Center(
              child: Text(
                state.e,
              ),
            );
          }else{
            return Column(
              children: [
                ElevatedButton(
                  onPressed: () {}, 
                  child: Text('Proyek Baru')
                ),
              ],
            );
          }
        }
      ),
    );
  }
}
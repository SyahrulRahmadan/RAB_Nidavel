import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:nidavel/models/material/material.dart' as material;
import 'package:nidavel/models/proyek/proyek.dart';

class ProyekTabCreation extends StatefulWidget {
  const ProyekTabCreation({super.key});

  @override
  State<ProyekTabCreation> createState() => _ProyekTabCreationState();
}

class _ProyekTabCreationState extends State<ProyekTabCreation> {
  late TextEditingController _nameController;
  late TextEditingController _clientController;
  material.MaterialSchemeModel? _selectedMaterial;

  @override
  void initState() {
    super.initState();
    _clientController =TextEditingController();
    _nameController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    final materialBloc = context.read<material.MaterialBloc>().state;
    if (materialBloc is material.MaterialLoaded){
      return SizedBox(
        height: 200,
        child: AlertDialog(
          title: const Text("Create New Proyek"),
          content: Column(
            children: [
              TextField(
                controller: _nameController,
                decoration: const InputDecoration(
                  labelText: 'Proyek Name',
                  labelStyle: TextStyle(),
                ),
              ),
              DropdownButtonFormField<material.MaterialSchemeModel>(
                value: _selectedMaterial,
                decoration: const InputDecoration(
                  labelText: 'Material Type', // Label for the dropdown
                ),
                items: materialBloc.materialSchemes.map((material.MaterialSchemeModel type) {
                  return DropdownMenuItem<material.MaterialSchemeModel>(
                    value: type,
                    child: Text(type.schemeName),
                  );
                }).toList(),
                onChanged: (material.MaterialSchemeModel? newValue) {
                  setState(() {
                    _selectedMaterial = newValue; // Update the selected value
                  });
                },
                validator: (value) => value == null ? 'Please select a material scheme' : null,
              ),
              TextField(
                controller: _clientController,
                decoration: const InputDecoration(
                  labelText: 'Proyek Client',
                  labelStyle: TextStyle(),
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              child: const Text("Cancel"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text("Create"),
              onPressed: () {
                context.read<ProyekBloc>().add(ProyekCreationEvent(ProyekModel(proyekId: '', proyekName: _nameController.text, proyekDate: DateTime.now(), proyekInternalValue: 0, proyekExternalValue: 0, profitLoss: 0, proyekClientName: _clientController.text, proyekScheme: _selectedMaterial!, proyekMaterial: [])));
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      );
    } else {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
  }
}
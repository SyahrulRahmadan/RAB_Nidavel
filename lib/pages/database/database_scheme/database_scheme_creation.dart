import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nidavel/models/material/material.dart' as material;

class DatabaseSchemeCreation extends StatefulWidget {
  const DatabaseSchemeCreation({super.key});

  @override
  State<DatabaseSchemeCreation> createState() => _DatabaseSchemeCreationState();
}

class _DatabaseSchemeCreationState extends State<DatabaseSchemeCreation> {
  late TextEditingController _nameController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Create New Material Scheme"),
      content: Column(
        children: [
          TextField(
            controller: _nameController,
            decoration: const InputDecoration(
              labelText: 'Scheme',
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
            context
            .read<material.MaterialBloc>()
            .add(
              material.MaterialSchemeEventCreation(
                newScheme: material.MaterialSchemeModel(
                  schemeName: _nameController.text
                )
              )
            );
            
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}
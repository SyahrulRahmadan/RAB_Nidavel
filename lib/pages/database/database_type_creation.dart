import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nidavel/models/material/material.dart' as material;

class DatabaseTypeCreation extends StatefulWidget {
  const DatabaseTypeCreation({super.key});

  @override
  State<DatabaseTypeCreation> createState() => _DatabaseTypeCreationState();
}

class _DatabaseTypeCreationState extends State<DatabaseTypeCreation> {
  late TextEditingController _tagController;
  late TextEditingController _lgController;

  @override
  void initState() {
    super.initState();
    _tagController = TextEditingController();
    _lgController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Create New Material Type"),
      content: SizedBox(
        height: 200,
        child: Column(
          children: [
            TextField(
              controller: _tagController,
              decoration: const InputDecoration(
                labelText: 'Type Tag',
                labelStyle: TextStyle(),
              ),
            ),
            TextField(
              controller: _lgController,
              decoration: const InputDecoration(
                labelText: 'Label',
                labelStyle: TextStyle(),
              ),
            ),
          ],
        ),
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
            .add(material.TypeEventCreation(
              typeCreate: material.MaterialTypeModel(
                typeLg: _lgController.text, 
                typeTag: _tagController.text)
              )
            );
            
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}
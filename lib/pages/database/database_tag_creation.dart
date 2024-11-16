import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nidavel/models/material/material.dart' as material;

class DatabaseTagCreation extends StatefulWidget {
  const DatabaseTagCreation({super.key});

  @override
  State<DatabaseTagCreation> createState() => _DatabaseTagCreationState();
}

class _DatabaseTagCreationState extends State<DatabaseTagCreation> {
  late TextEditingController _tagController;

  @override
  void initState() {
    super.initState();
    _tagController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Create New Material Tag"),
      content: Column(
        children: [
          TextField(
            controller: _tagController,
            decoration: const InputDecoration(
              labelText: 'Tag',
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
              material.TagEventCreation(
                tagCreate: material.MaterialTagModel(
                  tagName: _tagController.text
                ),
              ),
            );
            
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}
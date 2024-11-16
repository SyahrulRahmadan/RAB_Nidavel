import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:nidavel/models/material/material.dart' as material;

class DatabaseTagList extends StatefulWidget {
  const DatabaseTagList({super.key, required this.number, required this.tagModel});
  final int number;
  final material.MaterialTagModel tagModel;

  @override
  State<DatabaseTagList> createState() => _DatabaseTagListState();
}

class _DatabaseTagListState extends State<DatabaseTagList> {
  bool _editing = false;
  late TextEditingController _tagController;

  @override
  void initState() {
    super.initState();
    _tagController = TextEditingController(
      text: widget.tagModel.tagName,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Expanded(
            flex: 6,
            child: Center(
              child: !_editing ? Text(
                widget.tagModel.tagName,
              ) : 
              TextField(
                controller: _tagController,
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(),
          ),
          Expanded(
            flex: 2,
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: !_editing ? [
                  IconButton(
                    onPressed: () {
                      setState(() {
                        _editing = !_editing;
                      });
                    }, 
                    icon: const Icon(Icons.edit)
                  ),
                  IconButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: const Text("Confirm Delete"),
                            content: const Text("Are you sure you want to delete this item?"),
                            actions: [
                              TextButton(
                                child: const Text("Cancel"),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                              TextButton(
                                child: const Text("Delete"),
                                onPressed: () {
                                  context
                                  .read<material.MaterialBloc>()
                                  .add(
                                    material.TagEventDelete(
                                      number: widget.number
                                    ),
                                  );

                                  Navigator.of(context).pop();
                                },
                              ),
                            ],
                          );
                        },
                      );
                    }, 
                    icon: const Icon(Icons.delete)
                  ),
                ] :
                [
                  IconButton(
                    onPressed: () {
                      setState(() {
                        context
                        .read<material.MaterialBloc>()
                        .add(
                          material.TagEventUpdate(
                            number: widget.number, 
                            tag: _tagController.text
                          ),
                        );
                        _editing = !_editing;
                      });
                    }, 
                    icon: const Icon(Icons.check)
                  ),
                  IconButton(
                    onPressed: () {
                      setState(() { 
                        _editing = !_editing;
                      });
                    }, 
                    icon: const Icon(Icons.close)
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  } 
}
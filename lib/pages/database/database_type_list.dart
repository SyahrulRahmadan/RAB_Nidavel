import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:nidavel/models/material/material.dart' as material;

class DatabaseTypeList extends StatefulWidget {
  const DatabaseTypeList({super.key, required this.number, required this.typeModel});
  final int number;
  final material.MaterialTypeModel typeModel;

  @override
  State<DatabaseTypeList> createState() => _DatabaseTypeListState();
}

class _DatabaseTypeListState extends State<DatabaseTypeList> {
  bool _editing = false;
  late TextEditingController _tagController;
  late TextEditingController _lgController;

  @override
  void initState() {
    super.initState();
    _tagController = TextEditingController(
      text: widget.typeModel.typeTag,
    );
    _lgController = TextEditingController(
      text: widget.typeModel.typeLg,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Expanded(
            flex: 5,
            child: Center(
              child: !_editing ? Text(
                widget.typeModel.typeTag,
              ) : 
              TextField(
                controller: _tagController,
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Center(
              child: !_editing ? Text(
                widget.typeModel.typeLg,
              ) : 
              TextField(
                controller: _lgController,
              ),
            ),
          ),
          Expanded(
            flex: 1, 
            child: Center(
              child: Checkbox(
                value: widget.typeModel.x, 
                onChanged: (value) {
                  context
                  .read<material.MaterialBloc>()
                  .add(
                    material.TypeXEventToggle(
                      number: widget.number, 
                      newValue: value!
                    )
                  );
                } 
              )
            )
          ),
          Expanded(
            flex: 1, 
            child: Center(
              child: Checkbox(
                value: widget.typeModel.y, 
                onChanged: (value) {
                  context
                  .read<material.MaterialBloc>()
                  .add(
                    material.TypeYEventToggle(
                      number: widget.number, 
                      newValue: value!
                    )
                  );
                } 
              )
            )
          ),
          Expanded(
            flex: 1, 
            child: Center(
              child: Checkbox(
                value: widget.typeModel.z, 
                onChanged: (value) {
                  context
                  .read<material.MaterialBloc>()
                  .add(
                    material.TypeZEventToggle(
                      number: widget.number, 
                      newValue: value!
                    )
                  );
                } 
              )
            )
          ),
          Expanded(
            flex: 1, 
            child: Center(
              child: Checkbox(
                value: widget.typeModel.isInt, 
                onChanged: (value) {
                  context
                  .read<material.MaterialBloc>()
                  .add(
                    material.TypeIntEventToggle(
                      number: widget.number, 
                      newValue: value!
                    )
                  );
                }
              )
            )
          ),
          Expanded(
            flex: 4,
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
                                    material.TypeEventDelete(
                                      number: widget.number
                                    )
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
                          material.TypeEventUpdate(
                            number: widget.number, 
                            newLg: _lgController.text, 
                            newTag: _tagController.text
                          )
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
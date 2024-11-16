import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:nidavel/models/material/material.dart' as material;
import 'package:nidavel/models/pages/pages.dart';

import 'database_scheme_material_page.dart';

class DatabaseSchemeList extends StatefulWidget {
  const DatabaseSchemeList({super.key, required this.number, required this.schemeModel});
  final int number;
  final material.MaterialSchemeModel schemeModel;

  @override
  State<DatabaseSchemeList> createState() => _DatabaseSchemeListState();
}

class _DatabaseSchemeListState extends State<DatabaseSchemeList> {
  bool _editing = false;
  late TextEditingController _nameController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(
      text: widget.schemeModel.schemeName,
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _editing 
        ? null 
        : () {
          context.read<PagesBloc>().add(PagesCreatedEvent(page: PagesModel(body: DatabaseSchemeMaterialPage(number: widget.number), title: 'Scheme ${widget.schemeModel.schemeName}')));
        },
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(
              flex: 3,
              child: Center(
                child: !_editing ? Text(
                  widget.schemeModel.schemeName,
                ) : 
                TextField(
                  controller: _nameController,
                ),
              ),
            ),
            Expanded(
              flex: 1, 
              child: Container(),
            ),
            Expanded(
              flex: 1,
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
                              content: const Text("Are you sure you want to duplicate this item?"),
                              actions: [
                                TextButton(
                                  child: const Text("Cancel"),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                ),
                                TextButton(
                                  child: const Text("Duplicate"),
                                  onPressed: () {
                                    context.read<material.MaterialBloc>().add(material.MaterialSchemeEventDuplicate(index: widget.number));
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ],
                            );
                          },
                        );
                      }, 
                      icon: const Icon(Icons.content_copy_rounded)
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
                                    context.read<material.MaterialBloc>().add(material.MaterialSchemeEventDelete(index: widget.number));
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
                          context.read<material.MaterialBloc>().add(material.MaterialSchemeEventUpdate(index: widget.number, newName: _nameController.text, newDescription: ''));
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
      ),
    );
  } 
}
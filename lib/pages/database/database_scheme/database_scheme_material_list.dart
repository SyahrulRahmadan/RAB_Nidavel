  import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:nidavel/models/material/material.dart' as material;

class DatabaseSchemeMaterialList extends StatefulWidget {
  const DatabaseSchemeMaterialList({super.key, required this.scheme, required this.number, required this.materialModel});
  final int scheme;
  final int number;
  final material.MaterialModel materialModel;

  @override
  State<DatabaseSchemeMaterialList> createState() => _DatabaseSchemeMaterialListState();
}

class _DatabaseSchemeMaterialListState extends State<DatabaseSchemeMaterialList> {
  bool _editing = false;
  late TextEditingController _nameController;
  late TextEditingController _rapPriceController;
  late TextEditingController _rabPriceController;
  late material.MaterialTypeModel _selectedMaterialType;
  late material.MaterialTagModel _selectedMaterialTag;
  String? _priceError;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(
      text: widget.materialModel.materialName,
    );
    _rapPriceController = TextEditingController(
      text: widget.materialModel.rapPrice.toString(),
    );
    _rabPriceController = TextEditingController(
      text: widget.materialModel.rabPrice.toString(),
    );
    _selectedMaterialType = widget.materialModel.materialType;
    _selectedMaterialTag = widget.materialModel.materialTag;
  }

  bool _isValidPrice(String value) {
    return double.tryParse(value) != null && double.parse(value) >= 0;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Expanded(
            flex: 2,
            child: Center(
              child: !_editing ? Text(
                widget.materialModel.materialName,
              ) : 
              TextField(
                controller: _nameController,
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Center(
              child: !_editing ? Text(
                widget.materialModel.materialType.typeTag
              ) : BlocBuilder<material.MaterialBloc, material.MaterialState>(
                builder: (context, state) {
                  final typeList = (state as material.MaterialLoaded).materialTypes;
                  return DropdownButtonFormField<material.MaterialTypeModel>(
                    value: _selectedMaterialType,
                    items: typeList.map((material.MaterialTypeModel type) {
                      return DropdownMenuItem<material.MaterialTypeModel>(
                        value: type,
                        child: Text(type.typeTag));
                    }).toList(), 
                    onChanged: (material.MaterialTypeModel? value) {
                      setState(() {
                        _selectedMaterialType = value!;
                      });
                    }
                  );
                },
              )
              ,
            ),
          ),
          Expanded(
            flex: 3,
            child: Center(
              child: !_editing ? Text(
                widget.materialModel.materialTag.tagName
              ) : BlocBuilder<material.MaterialBloc, material.MaterialState>(
                builder: (context, state) {
                  final tagList = (state as material.MaterialLoaded).materialTag;
                  return DropdownButtonFormField<material.MaterialTagModel>(
                    value: _selectedMaterialTag,
                    items: tagList.map((material.MaterialTagModel type) {
                      return DropdownMenuItem<material.MaterialTagModel>(
                        value: type,
                        child: Text(type.tagName));
                    }).toList(), 
                    onChanged: (material.MaterialTagModel? value) {
                      setState(() {
                        _selectedMaterialTag = value!;
                      });
                    }
                  );
                },
              )
              ,
            ),
          ),
          Expanded(
            flex: 1,
            child: Center(
              child: !_editing ? Text(
                "Rp. ${widget.materialModel.rabPrice}"
              ) : 
              TextField(
                controller: _rabPriceController,
                decoration: InputDecoration(
                  errorText: _priceError,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Center(
              child: !_editing ? Text(
                "Rp. ${widget.materialModel.rapPrice}"
              ) : 
              TextField(
                controller: _rapPriceController,
                decoration: InputDecoration(
                  errorText: _priceError,
                ),
              ),
            ),
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
                                  context.read<material.MaterialBloc>().add(material.MaterialEventDelete(scheme: widget.scheme, index: widget.number));
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
                      final rabPriceInput = _rabPriceController.text;
                      final rapPriceInput = _rapPriceController.text;
                      if (_isValidPrice(rapPriceInput) && _isValidPrice(rabPriceInput)){
                        setState(() {
                          _priceError = null;
                          _editing = !_editing;
                        });
                        context.read<material.MaterialBloc>().add(material.MaterialEventUpdate(
                          scheme: widget.scheme, 
                          index: widget.number, 
                          newName: _nameController.text, 
                          newRabPrice: int.parse(_rabPriceController.text),
                          newRapPrice: int.parse(_rapPriceController.text), 
                          newTag: _selectedMaterialTag, 
                          newType: _selectedMaterialType
                        ));
                      } else {
                        setState((){
                          _priceError = "Please enter a valid price";
                        });
                      }
                      
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
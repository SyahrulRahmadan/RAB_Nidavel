import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nidavel/models/material/material.dart' as material;

class DatabaseSchemeMaterialCreation extends StatefulWidget {
  const DatabaseSchemeMaterialCreation({super.key, required this.scheme});
  final int scheme; 

  @override
  State<DatabaseSchemeMaterialCreation> createState() => _DatabaseSchemeMaterialCreationState();
}

class _DatabaseSchemeMaterialCreationState extends State<DatabaseSchemeMaterialCreation> {
  late TextEditingController _nameController;
  late TextEditingController _rabPriceController;
  late TextEditingController _rapPriceController;
  material.MaterialTagModel? _selectedMaterialTag;
  material.MaterialTypeModel? _selectedMaterialType;
  String? _priceError;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _rabPriceController = TextEditingController();
    _rapPriceController = TextEditingController();
  }

  bool _isValidPrice(String value) {
    return int.tryParse(value) != null && int.parse(value) >= 0;
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Add New Material"),
      content: Column(
        children: [
          TextField(
            controller: _nameController,
            decoration: const InputDecoration(
              labelText: 'Material Name',
            ),
          ),
          BlocBuilder<material.MaterialBloc, material.MaterialState>(
            builder: (context, state) {
              if (state is material.MaterialLoaded){
                return Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                child: Column(
                  children: [
                    DropdownButtonFormField<material.MaterialTypeModel>(
                      value: _selectedMaterialType,
                      decoration: const InputDecoration(
                        labelText: 'Material Type', // Label for the dropdown
                      ),
                      items: state.materialTypes.map((material.MaterialTypeModel type) {
                        return DropdownMenuItem<material.MaterialTypeModel>(
                          value: type,
                          child: Text(type.typeTag),
                        );
                      }).toList(),
                      onChanged: (material.MaterialTypeModel? newValue) {
                        setState(() {
                          _selectedMaterialType = newValue; // Update the selected value
                        });
                      },
                      validator: (value) => value == null ? 'Please select a material type' : null,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    DropdownButtonFormField<material.MaterialTagModel>(
                      value: _selectedMaterialTag,
                      decoration: const InputDecoration(
                        labelText: 'Material Type', // Label for the dropdown
                      ),
                      items: state.materialTag.map((material.MaterialTagModel type) {
                        return DropdownMenuItem<material.MaterialTagModel>(
                          value: type,
                          child: Text(type.tagName),
                        );
                      }).toList(),
                      onChanged: (material.MaterialTagModel? newValue) {
                        setState(() {
                          _selectedMaterialTag = newValue; // Update the selected value
                        });
                      },
                      validator: (value) => value == null ? 'Please select a material tag' : null,
                    ),
                  ],
                ),
              );
              }
              return const Center(
                child: CircularProgressIndicator(),
              );
            },
          ),
          TextField(
            controller: _rabPriceController,
            decoration: InputDecoration(
              labelText: 'Material RAB Price',
              errorText: _priceError,
            ),
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
          ),
          TextField(
            controller: _rapPriceController,
            decoration: InputDecoration(
              labelText: 'Material RAP Price',
              errorText: _priceError,
            ),
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
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
            final rabPriceInput = _rabPriceController.text;
            final rapPriceInput = _rapPriceController.text;
            if (_isValidPrice(rabPriceInput) && _isValidPrice(rabPriceInput)) {
              setState(() {
                _priceError = null; // Clear the error if the price is valid
              });

              // Proceed with creating the material
              context.read<material.MaterialBloc>().add(material.MaterialEventCreation(
                scheme: widget.scheme,
                newMaterial: material.MaterialModel(
                  materialName: _nameController.text,
                  materialTag: _selectedMaterialTag,
                  materialType: _selectedMaterialType,
                  rabPrice: int.parse(rabPriceInput), // Use the parsed valid price
                  rapPrice: int.parse(rapPriceInput),
                ),
              ));
              Navigator.of(context).pop();
            } else {
              setState(() {
                _priceError = "Please enter a valid price."; // Set error message if price is invalid
              });
            }
          },
        ),
      ],
    );
  }
}
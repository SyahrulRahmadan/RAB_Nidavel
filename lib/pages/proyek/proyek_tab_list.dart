import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:nidavel/models/proyek/proyek.dart';

class ProyekTabList extends StatefulWidget {
  const ProyekTabList({super.key, required this.number, required this.proyek});
  final int number;
  final ProyekModel proyek;

  @override
  State<ProyekTabList> createState() => _ProyekTabListState();
}

class _ProyekTabListState extends State<ProyekTabList> {
  bool _isEditing = false;
  late TextEditingController _nameController;
  late TextEditingController _clientController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(
      text: widget.proyek.proyekName
    );
    _clientController = TextEditingController(
      text: widget.proyek.proyekClientName
    );
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
              child:  _isEditing 
              ?  TextField(
                controller: _nameController,
              )
              : Text(
                widget.proyek.proyekName
              ),
            )
          ),
          Expanded(
            flex: 2,
            child: Center(
              child: Text(
                DateFormat('dd/MM/yyyy').format(widget.proyek.proyekDate)
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Center(
              child: Text(
                widget.proyek.proyekInternalValue.toString()
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Center(
              child: Text(
                widget.proyek.proyekInternalValue.toString()
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Center(
              child: Text(
                widget.proyek.profitLoss.toString()
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Center(
              child: _isEditing 
              ? TextField(
                controller: _clientController,
              )
              : Text(
                widget.proyek.proyekClientName
              ),
            ),
          ),
          const Expanded(
            flex: 2,
            child: Center(
              child: Text(
                'Project Creator'
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () {
                      setState(() {
                        _isEditing = !_isEditing;
                      });
                    }, 
                    icon: const Icon(Icons.edit)
                  ),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        _isEditing = !_isEditing;
                      });
                    }, 
                    icon: const Icon(Icons.delete)
                  )
                ],
              ),
            )
          ),
        ],
      ), 
    );
  }
}
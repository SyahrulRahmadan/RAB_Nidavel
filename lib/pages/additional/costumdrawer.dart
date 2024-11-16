import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:nidavel/models/pages/pages.dart';

class CostumDrawer extends StatefulWidget {
  const CostumDrawer({super.key});

  @override
  State<CostumDrawer> createState() => _CostumDrawerState();
}

class _CostumDrawerState extends State<CostumDrawer> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  bool _isExpanded = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 100),
      vsync: this,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _toggleDrawer() {
    setState(() {
      _isExpanded = !_isExpanded;
      if (_isExpanded) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    
    List<Widget> collapsedWidget = [
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 6.0),
        child: IconButton(
          onPressed: (){
            _toggleDrawer();
          }, 
          icon: const Icon(Icons.menu)
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 6.0),
        child: IconButton(
          onPressed: (){
            context.read<PagesBloc>().add(ChangedProjectEvent());
          }, 
          icon: const Icon(Icons.apartment)
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 6.0),
        child: IconButton(
          onPressed: (){
            context.read<PagesBloc>().add(ChangedDatabaseEvent());
          }, 
          icon: const Icon(Icons.handyman)
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 6.0),
        child: IconButton(
          onPressed: (){
            context.read<PagesBloc>().add(ChangedReportEvent());
          }, 
          icon: const Icon(Icons.summarize)
        ),
      ),
      const Spacer(),
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 6.0),
        child: IconButton(
          onPressed: (){
            context.read<PagesBloc>().add(ChangedSettingEvent());
          }, 
          icon: const Icon(Icons.settings)
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 6.0),
        child: IconButton(
          onPressed: (){
            context.read<PagesBloc>().add(ChangedInfoEvent());
          }, 
          icon: const Icon(Icons.info)
        ),
      ),
    ];

    List<Widget> expandedWidget = [
      const DrawerHeader(child: Text('Nidavel Project')),
      ListTile(
        leading: const Icon(Icons.apartment),
        title: const Text('Project'),
        hoverColor: const Color.fromARGB(255, 125, 173, 255),
        onTap: () {
          context.read<PagesBloc>().add(ChangedProjectEvent());
          _toggleDrawer();
        },
      ),
      ListTile(
        leading: const Icon(Icons.handyman),
        title: const Text('Database'),
        hoverColor: const Color.fromARGB(255, 125, 173, 255),
        onTap: () {
          context.read<PagesBloc>().add(ChangedDatabaseEvent());
          _toggleDrawer();
        },
      ),
      ListTile(
        leading: const Icon(Icons.summarize),
        title: const Text('Laporan'),
        hoverColor: const Color.fromARGB(255, 125, 173, 255),
        onTap: () {
          context.read<PagesBloc>().add(ChangedReportEvent());
          _toggleDrawer();
        },
      ),
      const Spacer(),
      ListTile(
        leading: const Icon(Icons.settings),
        title: const Text('Settings'),
        hoverColor: const Color.fromARGB(255, 125, 173, 255),
        onTap: () {
          context.read<PagesBloc>().add(ChangedSettingEvent());
          _toggleDrawer();
        },
      ),
      ListTile(
        leading: const Icon(Icons.info),
        title: const Text('About'),
        hoverColor: const Color.fromARGB(255, 125, 173, 255),
        onTap: () {
          context.read<PagesBloc>().add(ChangedInfoEvent());
          _toggleDrawer();
        },
      ),
    ];

    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Container(
          width: _isExpanded ? 100 * _controller.value + 150 : 50,
          // `width: _isExpanded ? 250 : 50,
          decoration: BoxDecoration(
            color: Color.lerp(Colors.white, const Color.fromARGB(255, 255, 255, 255), _controller.value) ?? Colors.white,
          ),
          child:  Column(
            children: _isExpanded ? expandedWidget : collapsedWidget,
          ),
        );
      },
    );
  }
}

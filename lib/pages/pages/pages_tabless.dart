import 'package:flutter/material.dart';
import 'package:nidavel/models/pages/pages.dart';

class PagesTabless extends StatelessWidget {
  const PagesTabless({super.key, required this.page});
  final PagesModel page;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.purpleAccent,
      //   title: const Center(child: Text('Nidavel Construction Project')),
      // ),
      body: page.body,
    );
  }
}
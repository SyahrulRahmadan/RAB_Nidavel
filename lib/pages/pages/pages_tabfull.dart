import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:nidavel/models/pages/pages.dart';
import 'pages_tab.dart';

class PagesTabfull extends StatefulWidget {
  const PagesTabfull({super.key, required this.pages});
  final List<PagesModel> pages;

  @override
  State<PagesTabfull> createState() => PagesTabfullState();
}

class PagesTabfullState extends State<PagesTabfull> {
  int _currPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            decoration: const BoxDecoration(
              border: BorderDirectional(bottom: BorderSide(color: Colors.black, width: 0.5))
            ),
            height: 30,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: widget.pages.length,
              itemBuilder: (context, index) {
                return PagesTab(
                  title: widget.pages[index].title,
                  currPage: index,
                  onChanged: () {
                    setState(() {
                      _currPage = index;
                    });
                  },
                  onDelete: () {
                    context.read<PagesBloc>().add(PagesDeletedEvent(index: index));
                    if (widget.pages.length - 1  == _currPage) {
                      setState(() {
                        _currPage = widget.pages.length - 2;
                      });
                    }
                  },
                  isActive: (index == _currPage) ? true : false
                );
              },
            ),
          ),
          Expanded(
            child: Container(
              child: widget.pages[_currPage].body, // Changed 'body' to 'content'
            ),
          ),
        ],
      ),
    );
  }
}
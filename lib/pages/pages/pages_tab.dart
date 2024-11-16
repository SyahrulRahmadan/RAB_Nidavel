import 'package:flutter/material.dart';

class PagesTab extends StatelessWidget {
  const PagesTab({super.key, required this.title, required this.currPage, required this.onChanged, required this.onDelete, required this.isActive});
  final String title;
  final int currPage;
  final VoidCallback onChanged;
  final VoidCallback onDelete;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onChanged();
      },
      child: Container(
        margin: const EdgeInsets.only(left: 0.5, top: 1),
        padding: EdgeInsets.only(top: 3, bottom: 3, left: 6, right: (currPage == 0) ? 6 : 0),
        decoration: BoxDecoration(
          border: Border.all(),
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(6),
            topRight: Radius.circular(6)
          ),
          color: isActive ? Colors.purpleAccent : Colors.white
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 12,
                  color: isActive ? Colors.white : Colors.black,
                  fontWeight: isActive ? FontWeight.w700 : FontWeight.normal
                ),
              ),
            ),
            currPage == 0 ? Container() : GestureDetector(
              onTap: () {
                onDelete();
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.redAccent,
                  borderRadius: BorderRadius.circular(2)
                ),
                padding: const EdgeInsets.all(1),
                margin: const EdgeInsets.all(3),
                child: const Icon(
                  color: Colors.white,
                  Icons.close,
                  size: 12,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
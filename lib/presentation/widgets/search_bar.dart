import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 6.0),
      decoration: const ShapeDecoration(
        shape: StadiumBorder(side: BorderSide(color: Colors.grey)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const [
          Icon(
            Icons.search,
            color: Colors.grey,
            size: 24,
          ),
          SizedBox(
            width: 8.0,
          ),
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                isDense: true,
                hintText: 'Search',
                hintStyle:
                    TextStyle(color: Colors.grey, fontSize: 16, height: 1),
                border: InputBorder.none,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

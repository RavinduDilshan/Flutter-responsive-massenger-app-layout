import 'package:flutter/material.dart';

import '../models/models.dart';

class SearchBar extends StatelessWidget {
  final User currentUser;
  const SearchBar({super.key, required this.currentUser});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 56,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100), color: Colors.white),
        padding: const EdgeInsets.fromLTRB(31, 12, 12, 12),
        child: Row(
          children: [
            const Icon(Icons.search),
            const SizedBox(width: 23.5),
            Expanded(
                child: TextField(
              maxLines: 1,
              decoration: InputDecoration(
                  isDense: true,
                  border: InputBorder.none,
                  hintText: 'Search replies',
                  hintStyle: Theme.of(context).textTheme.bodyMedium),
            )),
            CircleAvatar(
              backgroundImage: AssetImage(currentUser.avatarUrl),
            )
          ],
        ),
      ),
    );
  }
}

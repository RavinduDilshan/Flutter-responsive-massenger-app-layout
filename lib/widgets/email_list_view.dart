import 'package:flutter/material.dart';

import '../models/data.dart' as data;
import '../models/models.dart';
import 'email_widget.dart';
import 'search_bar.dart' as search_bar;

class EmailListView extends StatelessWidget {
  final int? selectedIndex;
  final ValueChanged<int>? onSelected;
  final User currentUser;
  const EmailListView(
      {super.key,
      this.selectedIndex,
      this.onSelected,
      required this.currentUser});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8),
      child: ListView(
        children: [
          const SizedBox(height: 8),
          search_bar.SearchBar(currentUser: currentUser),
          SizedBox(height: 8),
          ...List.generate(data.emails.length, (index) {
            return Padding(
              padding: EdgeInsets.only(bottom: 8),
              child: EmailWidget(),
            );
          })
        ],
      ),
    );
  }
}

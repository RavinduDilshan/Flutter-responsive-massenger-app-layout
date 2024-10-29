import 'package:animated_responsive_app_layout/destinations.dart';
import 'package:flutter/material.dart';

class DisappearingBottomNavigationBar extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int>? onDestinationSelected;
  const DisappearingBottomNavigationBar(
      {required this.selectedIndex, this.onDestinationSelected, super.key});

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
        selectedIndex: selectedIndex,
        onDestinationSelected: onDestinationSelected,
        elevation: 0,
        backgroundColor: Colors.white,
        destinations: destinations
            .map<NavigationDestination>((d) =>
                NavigationDestination(icon: Icon(d.icon), label: d.label))
            .toList());
  }
}

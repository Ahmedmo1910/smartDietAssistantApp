import 'package:dot_navigation_bar/dot_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:smart_bites/core/utils/app_colors.dart';

class FloatingNavigationBar extends StatefulWidget {
  final int currentIndex;
  final ValueChanged<int> onItemSelected;

  const FloatingNavigationBar({
    super.key,
    required this.currentIndex,
    required this.onItemSelected,
  });

  @override
  State<FloatingNavigationBar> createState() => _FloatingNavigationBarState();
}

class _FloatingNavigationBarState extends State<FloatingNavigationBar> {
  @override
  Widget build(BuildContext context) {
    return DotNavigationBar(
      marginR: const EdgeInsets.symmetric(horizontal: 16),
      paddingR: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
      currentIndex: widget.currentIndex,
      onTap: widget.onItemSelected,
      backgroundColor: AppColors.primaryColor,
      dotIndicatorColor: Colors.transparent,
      unselectedItemColor: Colors.white54,
      selectedItemColor: Colors.white,
      splashColor: Colors.transparent,
      boxShadow: [
        BoxShadow(
          // ignore: deprecated_member_use
          color: Colors.black.withOpacity(0.2),
          blurRadius: 8,
          offset: const Offset(0, 4),
        ),
      ],
      items: [
        DotNavigationBarItem(icon: Icon(Icons.home_filled)),
        DotNavigationBarItem(icon: Icon(Icons.restaurant)),
        DotNavigationBarItem(icon: Icon(Icons.favorite)),
      ],
    );
  }
}

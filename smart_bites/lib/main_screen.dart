import 'package:flutter/material.dart';
import 'package:smart_bites/features/home/presentation/views/home_screen.dart';
import 'package:smart_bites/features/home/presentation/views/widgets/floating_navigation_bar.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});
  static const String routeName = 'main';

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentIndex = 0;

  final List<Widget> screens = const [
    HomeScreen(),
    Center(child: Text("Meals Screen")),
    Center(child: Text("Favorites Screen")),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: SafeArea(child: screens[currentIndex]),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton:  FloatingNavigationBar(
        currentIndex: currentIndex,
        onItemSelected: (index) {
          setState(() {
            currentIndex = index;
          });
        },
      ),
    );
  }
}

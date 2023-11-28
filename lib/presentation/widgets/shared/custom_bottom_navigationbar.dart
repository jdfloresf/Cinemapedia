import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomBottomNavigation extends StatelessWidget {
  final int currentIndex;

  const CustomBottomNavigation({super.key, required this.currentIndex});

  void onItemTap(BuildContext context, int index) {
    switch (index) {
      case 0:
        context.go('/home/0');
        break;
      case 1:
        context.go('/home/1');
        break;
      case 2:
        context.go('/home/2');
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      elevation: 0, 
      currentIndex: currentIndex,
      onTap: (value) => onItemTap(context, value),
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home_max), 
          label: 'Inicio'
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.label_important_outline), 
          label: 'Categorías'
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite_outline), 
          label: 'Favoritos'
        ),
      ]
    );
  }
}

import 'package:flutter/material.dart';
// You must use Bloc for your state management, you cannot use any other state management
class MyBottomNavigationBar extends StatelessWidget {
  const MyBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      selectedItemColor: Colors.blue, // Set the color for the icons here
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: CircleAvatar(
            backgroundColor: Colors.blue, 
            child: Icon(
              Icons.account_circle,
              size: 30,
              color: Colors.white, 
            ),
          ),
          label: 'Profile',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.notifications,
            color: Colors.blue, 
          ),
          label: 'Notifications',
        ),
      ],
    );
  }
}

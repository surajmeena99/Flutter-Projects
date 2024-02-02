import 'package:flutter/material.dart';
import 'package:apnibook_app/screens.dart/home_screen.dart';
import 'package:apnibook_app/screens.dart/profile_screen.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectedIndex =0;

  List selectPage = const[
    HomeScreen(),
    ProfileScreen()
  ];
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //AppBar here
      //Drawer here
      body: Center(
        child: selectPage[_selectedIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home),
          label: "Home",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.account_circle),
          label: "Profile",
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: (index){
          setState(() {
            _selectedIndex = index;
          });
        },
        unselectedItemColor: Colors.black,
        selectedItemColor: Colors.white,
        backgroundColor: Colors.green,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
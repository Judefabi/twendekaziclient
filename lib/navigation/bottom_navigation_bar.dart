import 'package:flutter/material.dart';
import 'package:twendekaziclient/screens/google_maps_markers.dart';
import 'package:twendekaziclient/screens/home/home_screen.dart';
// import 'package:twendekaziclient/screens/home_screen.dart';
import 'package:twendekaziclient/screens/notifications_screen.dart';
import 'package:twendekaziclient/screens/myorders_screen.dart';
import 'package:twendekaziclient/screens/profile_screen.dart';
import 'package:twendekaziclient/screens/wallet_screen.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildBody(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        elevation: 0,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black12,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        onTap: (index) => setState(() => _currentIndex = index),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.apps),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.work_rounded),
            label: 'Wallet',
          ),
          
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
          
        ],
      ),
    );
  }

  buildBody() {
    switch (_currentIndex) {
      case 1:
        return const MyOrdersScreen();
      case 2:
        return ProfileScreen();
      // case 4:
      //   return const WalletScreen();

      case 0:
        return HomeScreen();
    }
  }
}

import 'package:firebase_core/firebase_core.dart';
import 'package:twendekaziclient/404screens/empty_jobs_page.dart';
import 'package:twendekaziclient/screens/google_maps_markers.dart';
import 'package:twendekaziclient/screens/new_order.dart';
import 'firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:twendekaziclient/navigation/bottom_navigation_bar.dart';
import 'package:twendekaziclient/screens/myorders_screen.dart';
import 'package:twendekaziclient/screens/notifications_screen.dart';
import 'package:twendekaziclient/screens/profile_screen.dart';
import 'package:twendekaziclient/screens/wallet_screen.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp(
//       // options: DefaultFirebaseOptions.currentPlatform,
//       );
//   runApp(const MyApp());
// }
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Twendekazi Client',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:  GoogleMapScreen(),
      getPages: [
        GetPage(name: '/orders', page: () => const MyOrdersScreen()),
        GetPage(name: '/notifications', page: () => const NotificationScreen()),
        GetPage(name: '/profile', page: () => const ProfileScreen()),
        GetPage(name: '/wallet', page: () => const WalletScreen())
      ],
    );
  }
}

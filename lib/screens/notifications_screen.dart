import 'package:flutter/material.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({
    Key ? key,
  }): super(key: key);

  @override
  State < NotificationScreen > createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State < NotificationScreen > {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text('Homepage'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              'Notifications',
            ),
          ],
        ),
      ),
    );
  }
}
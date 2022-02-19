import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:twendekaziclient/screens/myorders_screen.dart';
import 'package:twendekaziclient/screens/wallet_screen.dart';
import 'package:twendekaziclient/widgets/profile_container.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    const urlImage =
        'https://images.unsplash.com/photo-1531123897727-8f129e1688ce?ixid=MnwxMjA3fDB8MHxzZWFyY2h8Nnx8cG9ydHJhaXR8ZW58MHx8MHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60';
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text('Profile',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            )),
        centerTitle: true,
        elevation: 0.0,
        foregroundColor: Colors.black,
        actions: const [],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        //Profile header
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ProfileContainer(),
            // _buildListTiles(
            //   'Orders',
            //   'Orders posted',
            // ),
            const SizedBox(height: 10),
            _buildListTiles('Address', 'Orders posted'),
            const SizedBox(height: 10),
            _buildListTiles(
              'Wallet',
              'Orders posted',
            ),
            const SizedBox(height: 10),
            _buildListTiles('Settings', 'Orders posted'),
            const SizedBox(height: 10),
          ],
        ),

        //options section
      ),
    );
  }

  Widget _buildListTiles(
    String title,
    String subtitle,
  ) {
    return Card(
      child: ListTile(
        leading: const SizedBox(
          width: 1.0,
        ),
        title: Text(title),
        subtitle: Text(subtitle),
        trailing: IconButton(
            onPressed: () {}, icon: const Icon(Icons.arrow_forward_ios)),
      ),
    );
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:twendekaziclient/model/order_model.dart';
import 'package:twendekaziclient/model/providers_model.dart';
import 'package:twendekaziclient/model/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:twendekaziclient/screens/new_order.dart';
import 'package:twendekaziclient/screens/providers_screen.dart';
import 'login_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  User? user = FirebaseAuth.instance.currentUser;
  UserModel loggedInUser = UserModel();

  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  // final Service services;
  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance
        .collection("users")
        .doc(user?.uid)
        .get()
        .then((value) {
      this.loggedInUser = UserModel.fromMap(value.data());
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    const urlImage =
        'https://images.unsplash.com/photo-1531123897727-8f129e1688ce?ixid=MnwxMjA3fDB8MHxzZWFyY2h8Nnx8cG9ydHJhaXR8ZW58MHx8MHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60';
    return Scaffold(
        floatingActionButton: FloatingActionButton(
            onPressed: () {
              Get.to(const NewOrderScreen());
            },
            backgroundColor: Colors.black,
            child: const Icon(Icons.work_rounded, color: Colors.white)),
        // appBar:
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const SizedBox(
              height: 75,
            ),
            //app bar
            // Padding(
            //   padding: const EdgeInsets.only(left: 20.0),
            //   child: Container(
            //     height: 50,
            //     child: const Icon(
            //       Icons.menu,
            //       size: 40,
            //     ),
            //     padding: const EdgeInsets.all(10.0),
            //     decoration: BoxDecoration(
            //       border: Border.all(color: Colors.white),
            //       borderRadius: BorderRadius.circular(12),
            //       color: Colors.grey[200],
            //     ),
            //   ),
            // ),
            const SizedBox(
              height: 25,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 20),
              child: Text(
                'Twendekazi',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
              ),
            ),
            const SizedBox(
              height: 15,
            ),

            //Job Categories
            const Padding(
              padding: EdgeInsets.only(left: 20),
              child: Text(
                '-- your Kazi Home',
                style: TextStyle(fontWeight: FontWeight.w400, fontSize: 25),
              ),
            ),
            const SizedBox(
              height: 55,
            ),
            //search area
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.grey[200],
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.circular(12)),
                      child: Row(children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: Container(
                            height: 30,
                            decoration: BoxDecoration(color: Colors.grey[200]),
                            child: const Icon(
                              Icons.search_rounded,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        const Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Search for service providers"),
                          ),
                        ),
                      ]),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Container(
                    height: 50,
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                        color: Colors.grey[800],
                        borderRadius: BorderRadius.circular(12)),
                    child: const Icon(
                      Icons.filter_alt_outlined,
                      color: Colors.white,
                    ),
                  )
                ])),
            const SizedBox(
              height: 50,
            ),

            //Job Categories
            const Padding(
              padding: EdgeInsets.only(left: 20),
              child: Text(
                'For You',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
              ),
            ),
            const SizedBox(height: 25),
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Container(
                height: 250,
                // decoration: BoxDecoration(color: Colors.black),
                child: ListView(scrollDirection: Axis.horizontal, children: [
                  _categoriesCard(
                      'https://images.unsplash.com/photo-1517677208171-0bc6725a3e60?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8bGF1bmRyeXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60',
                      'Laundry'),
                  _categoriesCard(
                      'https://images.unsplash.com/photo-1517646287270-a5a9ca602e5c?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8cGx1bWJpbmd8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60',
                      'Plumbing'),
                  _categoriesCard(
                      'https://images.unsplash.com/photo-1621905251189-08b45d6a269e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mjd8fGVsZWN0cmljYWx8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60',
                      'Electrical'),
                  _categoriesCard(
                      'https://images.unsplash.com/photo-1487754180451-c456f719a1fc?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8YXV0byUyMHJlcGFpcnxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60',
                      'Auto Repair'),
                ]),
              ),
            ),
            const SizedBox(
              height: 25,
            ),

            //Job Categories
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Text(
                    'Top Rated',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: TextButton(
                      onPressed: () {
                        Get.to(const ProvidersScreen());
                      },
                      child: const Text('See All',
                          style: TextStyle(fontSize: 16, color: Colors.green))),
                ),
              ],
            ),
            // const SizedBox(height: 10),
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Container(
                  height: 300,
                  child: StreamBuilder<List<Provider>>(
                    stream: getProviders(),
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        return Text('Something went wrong ${snapshot.error}');
                      } else if (snapshot.hasData) {
                        final providers = snapshot.data!;
                        return ListView(
                          physics: NeverScrollableScrollPhysics(),
                          children: providers.map(_profileCard).toList(),
                        );
                      } else {
                        return const Center(child: CircularProgressIndicator());
                      }
                    },
                  ),
                ),
              ),
            ),
          ]),
        ));
  }

  // the logout function
  Future<void> logout(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const LoginScreen()));
  }

  Stream<List<Provider>> getProviders() {
    return _firebaseFirestore.collection('providers').snapshots().map(
        (snapshot) =>
            snapshot.docs.map((doc) => Provider.fromJson(doc.data())).toList());
  }

  Widget _profileCard(Provider provider) {
    return InkWell(
      onTap: () {},
      child: Card(
        child: Padding(
            padding: const EdgeInsets.only(bottom: 12.0),
            child: Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(6)),
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(children: [
                        ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Container(
                                padding: const EdgeInsets.all(12),
                                color: Colors.grey[300],
                                height: 50,
                                child: Container())),
                        const SizedBox(width: 10),
                        Column(children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                provider.firstName,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                              const SizedBox(width: 5),
                              Text(
                                provider.secondName,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 4),
                          Text(
                            provider.email,
                            style: TextStyle(
                              color: Colors.grey[600],
                            ),
                          )
                        ]),
                      ]),
                      ClipRRect(
                          borderRadius: BorderRadius.circular(4),
                          child: Container(
                              padding: const EdgeInsets.all(5),
                              color: Colors.green[300],
                              child: const Text(
                                'Top Rated',
                                style: TextStyle(color: Colors.white),
                              )))
                    ]))),
      ),
    );
  }

  Widget _categoriesCard(String imageUrl, String servicename) {
    return Card(
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Column(children: [
          Container(
              height: 200,
              width: 200,
              child: Ink.image(
                  image: NetworkImage(
                    imageUrl,
                  ),
                  height: 150,
                  fit: BoxFit.cover)),
          Container(
              padding: const EdgeInsets.all(5),
              decoration: const BoxDecoration(color: Colors.white),
              child: Text(servicename,
                  style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      fontSize: 18)))
        ]));
  }
}




// ActionChip(
//     label: const Text("Logout"),
//     onPressed: () {
//       logout(context);
//     }),
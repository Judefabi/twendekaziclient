import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:twendekaziclient/model/order_model.dart';
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
        floatingActionButton: FloatingActionButton(onPressed: () {
          Get.to(const NewOrderScreen());
        },
        backgroundColor: Colors.black,
        child: const Icon(Icons.work_rounded, color: Colors.white)
        ),
        // appBar:
        backgroundColor: Colors.grey[300],
        body: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const SizedBox(
              height: 75,
            ),
            //app bar
            Padding(
              padding: const EdgeInsets.only(left: 25.0),
              child: Container(
                height: 50,
                child: const Icon(
                  Icons.menu,
                  size: 40,
                ),
                padding: const EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.grey[200],
                ),
              ),
            ),
            const SizedBox(
              height: 25,
            ),

            //Job Categories
            const Padding(
              padding: EdgeInsets.only(left: 25),
              child: Text(
                'Your Kazi Home',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            //search area
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
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
              padding: EdgeInsets.only(left: 25),
              child: Text(
                'Categories For You',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
              ),
            ),
            const SizedBox(height: 25),
            Container(
              height: 160,
              child: Container(),
              // StreamBuilder<List<Service>>(
              //   stream: getServices(),
              //   builder: (context, snapshot) {
              //     if (snapshot.hasError) {
              //       return Text('Something went wrong ${snapshot.error}');
              //     } else if (snapshot.hasData) {
              //       final services = snapshot.data!;
              //       return ListView(
              //           scrollDirection: Axis.horizontal,
              //           children: services.map(ServicesCard).toList());
              //     } else {
              //       return const Center(child: CircularProgressIndicator());
              //     }
              //   },
              // ),
            ),
            const SizedBox(
              height: 50,
            ),

            //Job Categories
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 25),
                  child: Text(
                    'Top Rated',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                  ),
                ),
                TextButton(
                    onPressed: () {
                      Get.to(const ProvidersScreen());
                    },
                    child: const Text('See All',
                        style: TextStyle(fontSize: 16, color: Colors.green))),
              ],
            ),
            // const SizedBox(height: 10),
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 15.0, bottom: 10.0, right: 10.0),
                child: Container(
                  height: 700,
                  child: ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 3,
                    itemBuilder: (context, index) {
                      return Column(children: [
                        const topProvidersCard(),
                        const SizedBox(height: 10)
                      ]);
                    },
                  ),
                  // StreamBuilder<List<Order>>(
                  //   stream: getOrders(),
                  //   builder: (context, snapshot) {
                  //     if (snapshot.hasError) {
                  //       return Text('Something went wrong ${snapshot.error}');
                  //     } else if (snapshot.hasData) {
                  //       final orders = snapshot.data!;
                  //       return ListView(
                  //           shrinkWrap: true,
                  //           physics: const NeverScrollableScrollPhysics(),
                  //           children: orders.map(topProviders).toList());
                  //     } else {
                  //       return const Center(child: CircularProgressIndicator());
                  //     }
                  //   },
                  // ),
                ),
              ),
            )
          ]),
        ));
  }

  // the logout function
  Future<void> logout(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const LoginScreen()));
  }

  // Stream<List<Order>> getOrders() {
  //   return _firebaseFirestore.collection('orders').snapshots().map(
  //       (snapshot) =>
  //           snapshot.docs.map((doc) => Order.fromJson(doc.data())).toList());
  // }

  // Stream<List<Service>> getServices() {
  //   return _firebaseFirestore
  //       .collection('providers')
  //       .doc('3NwtKCoqq4TzT9OSMJxbxMMAJ283')
  //       .collection('services')
  //       .snapshots()
  //       .map((snapshot) =>
  //           snapshot.docs.map((doc) => Service.fromJson(doc.data())).toList());
  // }

  Widget topProviders(Order Order) {
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
                          const Text(
                            'Order.Ordername',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            '{Order.Orderid}',
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
                                'Kshs.{Order.Orderprice}',
                                style: TextStyle(color: Colors.white),
                              )))
                    ]))),
      ),
    );
  }

  getOrders() {}

  getServices() {}

  // Widget ServicesCard(Service services) {
  //   return InkWell(
  //       onTap: () {},
  //       child: Padding(
  //         padding: const EdgeInsets.only(left: 25.0),
  //         child: ClipRRect(
  //           borderRadius: BorderRadius.circular(12),
  //           child: Container(
  //               width: 250,
  //               padding: const EdgeInsets.all(12.0),
  //               color: Colors.grey[800],
  //               child: Column(
  //                 crossAxisAlignment: CrossAxisAlignment.start,
  //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                 children: [
  //                   Row(
  //                       crossAxisAlignment: CrossAxisAlignment.start,
  //                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                       children: [
  //                         Container(
  //                             height: 60,
  //                             child: Container(
  //                               color: Colors.white,
  //                             )),
  //                         ClipRRect(
  //                           borderRadius: BorderRadius.circular(5),
  //                           child: Container(
  //                             padding: const EdgeInsets.all(8.0),
  //                             child: Text(
  //                               services.serviceexpertise,
  //                               style: const TextStyle(color: Colors.white),
  //                             ),
  //                             color: Colors.grey[500],
  //                           ),
  //                         )
  //                       ]),
  //                   Padding(
  //                     padding: const EdgeInsets.all(0.0),
  //                     child: Text(
  //                       services.servicename,
  //                       style: const TextStyle(
  //                         fontWeight: FontWeight.bold,
  //                         fontSize: 22,
  //                         color: Colors.white,
  //                       ),
  //                     ),
  //                   ),
  //                   Text(
  //                     'Kshs. ${services.servicerate}',
  //                     style: const TextStyle(
  //                       fontWeight: FontWeight.bold,
  //                       fontSize: 16,
  //                       color: Colors.white,
  //                     ),
  //                   )
  //                 ],
  //               )),
  //         ),
  //       ));
  // }
}

class topProvidersCard extends StatelessWidget {
  const topProvidersCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
          height: 200,
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              gradient:
                  const LinearGradient(colors: [Colors.white, Colors.grey]),
              boxShadow: const [BoxShadow(color: Colors.grey)]),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: <
                  Widget>[
            Row(children: <Widget>[
              Container(
                  padding: const EdgeInsets.all(2),
                  decoration: const BoxDecoration(
                      color: Colors.black, shape: BoxShape.circle),
                  child: const CircleAvatar(
                      maxRadius: 30.0,
                      backgroundImage: NetworkImage(
                        "https://images.unsplash.com/photo-1531123897727-8f129e1688ce?ixid=MnwxMjA3fDB8MHxzZWFyY2h8Nnx8cG9ydHJhaXR8ZW58MHx8MHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60",
                      ))),
              const SizedBox(width: 21),
              Expanded(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                    Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Expanded(
                              child: Text("Jane Doe",
                                  maxLines: 2,
                                  overflow: TextOverflow.clip,
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline6!
                                      .apply(
                                          fontWeightDelta: 2,
                                          color: Colors.black))),
                          const SizedBox(width: 15),
                          GestureDetector(
                            child: const Icon(Icons.map, color: Colors.black),
                            onTap: () {},
                          )
                        ]),
                    const SizedBox(height: 10),
                    Text("Janedoe2001@gmail.com",
                        style: Theme.of(context)
                            .textTheme
                            .subtitle1!
                            .apply(color: Colors.black))
                  ]))
            ]),
            const SizedBox(height: 25),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Column(children: <Widget>[
                    Text('123',
                        style: Theme.of(context)
                            .textTheme
                            .headline6!
                            .apply(color: Colors.black)),
                    const SizedBox(height: 3),
                    Text("Jobs Assigned",
                        style: TextStyle(color: Colors.grey[800]))
                  ]),
                  Column(children: <Widget>[
                    Text('119',
                        style: Theme.of(context)
                            .textTheme
                            .headline6!
                            .apply(color: Colors.black)),
                    const SizedBox(height: 3),
                    Text("Completed", style: TextStyle(color: Colors.grey[800]))
                  ]),
                  // Column(children: <Widget>[
                  //   Text('3',
                  //       style: Theme.of(context)
                  //           .textTheme
                  //           .headline6!
                  //           .apply(color: Colors.black)),
                  //   const SizedBox(height: 3),
                  //   Text("Likes", style: TextStyle(color: Colors.grey[300]))
                  // ]),
                  Column(children: <Widget>[
                    Text('98%',
                        style: Theme.of(context)
                            .textTheme
                            .headline6!
                            .apply(color: Colors.black)),
                    const SizedBox(height: 3),
                    Text("Rating", style: TextStyle(color: Colors.grey[800]))
                  ])
                ])
          ])),
    );
  }
}


// ActionChip(
//     label: const Text("Logout"),
//     onPressed: () {
//       logout(context);
//     }),
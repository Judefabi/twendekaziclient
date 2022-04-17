import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:twendekaziclient/controllers/order_controller.dart';
import 'package:twendekaziclient/model/order_model.dart';
import 'package:twendekaziclient/model/providers_model.dart';
import 'package:twendekaziclient/screens/google_maps_markers.dart';
import 'package:twendekaziclient/services/database_service.dart';

class ProvidersScreen extends StatefulWidget {
  const ProvidersScreen({Key? key}) : super(key: key);

  @override
  _ProvidersScreenState createState() => _ProvidersScreenState();
}

class _ProvidersScreenState extends State<ProvidersScreen> {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                Get.back();
              },
            );
          },
        ),
        title: const Text('Service Providers',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            )),
        centerTitle: true,
        elevation: 0.0,
        foregroundColor: Colors.black,
        actions: [
          IconButton(
              onPressed: () {}, icon: const Icon(Icons.drag_indicator_sharp))
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Get.to(GoogleMapScreen());
        },
        backgroundColor: Colors.black,
        icon: const Icon(Icons.map, color: Colors.white),
        label: const Text('Map',
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
        foregroundColor: Colors.white,
      ),
      // bottomNavigationBar: BottomAppBar(
      //     child: Container(
      //         padding:
      //             const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      //         child: Row(
      //             crossAxisAlignment: CrossAxisAlignment.center,
      //             mainAxisAlignment: MainAxisAlignment.center,
      //             children: [
      //               Material(
      //                 elevation: 5,
      //                 borderRadius: BorderRadius.circular(10),
      //                 color: Colors.black,
      //                 child: MaterialButton(
      //                     padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
      //                     minWidth: MediaQuery.of(context).size.width * 0.5,
      //                     onPressed: () async {},
      //                     // updateLocation;
      //                     // Get.to(const LoginScreen());
      //                     child: Row(children: const [
      //                       Text(
      //                         "VIEW MAP",
      //                         textAlign: TextAlign.center,
      //                         style: TextStyle(
      //                             fontSize: 16,
      //                             color: Colors.white,
      //                             fontWeight: FontWeight.bold),
      //                       ),
      //                       SizedBox(
      //                         width: 10,
      //                       ),
      //                       Icon(Icons.map, color: Colors.white)
      //                     ])),
      //               ),
      //             ]))),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: StreamBuilder<List<Provider>>(
          stream: getProviders(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Text('Something went wrong ${snapshot.error}');
            } else if (snapshot.hasData) {
              final providers = snapshot.data!;
              return ListView(
                children: providers.map(_profileCard).toList(),
              );
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }

  Stream<List<Provider>> getProviders() {
    return _firebaseFirestore.collection('providers').snapshots().map(
        (snapshot) =>
            snapshot.docs.map((doc) => Provider.fromJson(doc.data())).toList());
  }

  Widget _profileCard(Provider provider) {
    return InkWell(
      onTap: () {},
      child: Container(
          margin: const EdgeInsets.symmetric(vertical: 5),
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
                              child: Row(children: [
                            Text(provider.firstName,
                                maxLines: 2,
                                overflow: TextOverflow.clip,
                                style: Theme.of(context)
                                    .textTheme
                                    .headline6!
                                    .apply(
                                        fontWeightDelta: 2,
                                        color: Colors.black)),
                            const SizedBox(width: 5),
                            Text(provider.secondName,
                                maxLines: 2,
                                overflow: TextOverflow.clip,
                                style: Theme.of(context)
                                    .textTheme
                                    .headline6!
                                    .apply(
                                        fontWeightDelta: 2,
                                        color: Colors.black))
                          ])),
                          const SizedBox(width: 15),
                          GestureDetector(
                            child: const Icon(Icons.map, color: Colors.black),
                            onTap: () {},
                          )
                        ]),
                    const SizedBox(height: 10),
                    Text(provider.email,
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

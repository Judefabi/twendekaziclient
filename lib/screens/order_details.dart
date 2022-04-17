import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutterwave/flutterwave.dart';
import 'package:get/get.dart';
import 'package:twendekaziclient/model/bids_model.dart';
import 'package:twendekaziclient/model/order_model.dart';
import 'package:intl/intl.dart';
import 'package:twendekaziclient/model/user_model.dart';
import 'package:twendekaziclient/screens/complete_job.dart';
import 'package:twendekaziclient/screens/myorders_screen.dart';

class OrderDetailsScreen extends StatelessWidget {
  final Order order;
  OrderDetailsScreen({Key? key, required this.order}) : super(key: key);

  // final orderController orderController = Get.put(orderController());
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: Builder(
            builder: (BuildContext context) {
              return IconButton(
                icon: const Icon(Icons.menu),
                onPressed: () {
                  Get.back();
                },
              );
            },
          ),
          title: const Text('Order Details',
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
        bottomNavigationBar: BottomAppBar(
            child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Material(
                        elevation: 5,
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.black,
                        child: MaterialButton(
                            padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
                            minWidth: MediaQuery.of(context).size.width * 0.5,
                            onPressed: () async {
                              final FirebaseAuth auth = FirebaseAuth.instance;
                              final User? user = auth.currentUser;
                              UserModel loggedInUser = UserModel();

                              // _saveOrder();
                              final bid = Bid(
                                ordername: order.ordername,
                                orderid: order.orderid,
                                orderdescription: order.orderdescription,
                                orderdetails: order.orderdetails,
                                ordercreatedAt: order.ordercreatedAt,
                                ordercategory: order.ordercategory,
                                orderdate: order.orderdate,
                                orderownerid: order.orderownerid,
                                orderprice: order.orderprice,
                                providerid: order.providerid,
                                isAssigned: true,
                                // phonenumber: 0791808163, 
                                // providername: '${loggedInUser.firstName} ${loggedInUser.secondName}',
                              );

                              completeJob(context, bid);
                            },
                            // updateLocation;
                            // Get.to(const LoginScreen());
                            child: const Text(
                              "MARK COMPLETE",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            )),
                      ),
                    ]))),
        body: SingleChildScrollView(
          child: Column(children: [
            Padding(
                padding:
                    const EdgeInsets.only(left: 10.0, right: 10.0, top: 20),
                child: Column(children: [
                  Container(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              order.ordername,
                              style: const TextStyle(
                                  fontSize: 26, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 15),
                            Text(
                              'Assigned to: ${order.providerid}',
                              style: const TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            // IconButton(
                            //   icon: const Icon(Icons.bookmark_add_outlined,
                            //       color: Colors.black),
                            //     onPressed: () {},
                            // ),
                          ],
                        ),
                        Divider(
                            height: 50,
                            color: Colors.grey[600],
                            thickness: 0.5),
                        // const SizedBox(height: 25),
                        Text(
                          order.orderdescription,
                          style: const TextStyle(
                            fontSize: 14,
                          ),
                          textAlign: TextAlign.start,
                        ),
                        Divider(
                            height: 50,
                            color: Colors.grey[600],
                            thickness: 0.5),
                        Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text('Rate',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w300,
                                  )),
                              const SizedBox(height: 5),
                              Text('Kshs. ${order.orderprice}',
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ))
                            ]),
                        // const SizedBox(height: 15),
                        Divider(
                            height: 50,
                            color: Colors.grey[600],
                            thickness: 0.5),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text('Approx. Duration',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w300,
                                    )),
                                SizedBox(height: 5),
                                Text('3 Hrs',
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold)),
                              ],
                            ),
                            Divider(
                                height: 50,
                                color: Colors.grey[600],
                                thickness: 0.5),
                            Column(
                              children: const [
                                Text('Complexity',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w300,
                                    )),
                                SizedBox(height: 5),
                                Text('Very Complex',
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold)),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 25),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('Category',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w300,
                                )),
                            const SizedBox(height: 5),
                            Text(order.ordercategory,
                                style: const TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.bold)),
                          ],
                        ),
                        Divider(
                          height: 50,
                          thickness: 0.5,
                          color: Colors.grey[600],
                        ),
                        Text('Detailed Description',
                            style: TextStyle(
                              color: Colors.grey[800],
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            )),
                        Text(order.orderdetails,
                            style: const TextStyle(
                              fontSize: 14,
                            ))
                      ])),
                ]))
          ]),
        ));
  }

  Future completeJob(BuildContext context, Bid bid) async {
    final placebid = FirebaseFirestore.instance
        .collection('completedorders')
        .doc(order.orderid);

    final json = bid.toJson();
    await placebid.set(json).then((value) => {
          // Fluttertoast.showToast(msg: "Marked Complete!!"),
          // Get.to(CompleteJob(order: order, bid: bid,)),
          _makeFlutterwavepay(context),
        });
  }

  Future _makeFlutterwavepay(context) async {
                try {
                  UserModel loggedInUser = UserModel();
                  Flutterwave flutterwave = Flutterwave.forUIPayment(
                      //the first 10 fields below are required/mandatory
                      context: context,
                      fullName: "Twendekazi Payment",
                      phoneNumber: order.orderdescription,
                      email: "judefabiano99@gmail.com",
                      amount: "${order.orderprice}",
                      //Use your Public and Encription Keys from your Flutterwave account on the dashboard
                      encryptionKey: "FLWSECK_TESTdcbbcedcb159",
                      publicKey:
                          "FLWPUBK_TEST-bca16c1df40dad9a9d36254c8e7927b4-X",
                      currency: "KES",
                      txRef: DateTime.now().toIso8601String(),
                      //Setting DebugMode below to true since will be using test mode.
                      //You can set it to false when using production environment.
                      isDebugMode: true,
                      //configure the the type of payments that your business will accept
                      acceptCardPayment: true,
                      acceptUSSDPayment: false,
                      acceptAccountPayment: false,
                      acceptFrancophoneMobileMoney: false,
                      acceptGhanaPayment: false,
                      acceptMpesaPayment: true,
                      acceptRwandaMoneyPayment: false,
                      acceptUgandaPayment: false,
                      acceptZambiaPayment: false);

                  final response = await flutterwave.initializeForUiPayments();
                  if (response == null) {
                    print("Transaction Failed");
                  } else {
                    if (response.status == "Transaction successful") {
                      print(response.data);
                      print(response.message);
                    } else {
                      print(response.message);
                    }
                  }
                } catch (error) {
                  print(error);
                  // Fluttertoast.showToast(msg: error);
                }
              }
}

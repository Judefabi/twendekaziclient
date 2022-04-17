import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:twendekaziclient/model/bids_model.dart';
import 'package:twendekaziclient/model/order_model.dart';
import 'package:twendekaziclient/model/user_model.dart';
import 'package:twendekaziclient/screens/myorders_screen.dart';

class BidsScreen extends StatelessWidget {
  final Order order;
  BidsScreen({Key? key, required this.order}) : super(key: key);

  User? user = FirebaseAuth.instance.currentUser;
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // floatingActionButton: FloatingActionButton(
      //     onPressed: () {
      //       Get.to(const NewBidsScreen());
      //     },
      //     backgroundColor: Colors.black,
      //     child: Icon(Icons.post_add_outlined, color: Colors.white)),
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
        title: const Text('Available Bids',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            )),
        centerTitle: true,
        elevation: 0.0,
        foregroundColor: Colors.black,
        actions: const [],
      ),
      body: StreamBuilder<List<Bid>>(
        stream: getBid(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text('Something went wrong ${snapshot.error}');
          } else if (snapshot.hasData) {
            final bid = snapshot.data!;
            return ListView(children: bid.map(_buildbidCard).toList());
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }

  Stream<List<Bid>> getBid() {
    return _firebaseFirestore
        .collection('orders')
        .doc(order.orderid)
        .collection('bids')
        .snapshots()
        .map((snapshot) =>
            snapshot.docs.map((doc) => Bid.fromJson(doc.data())).toList());
  }

  void _acceptBid() {}

  Widget _buildbidCard(Bid bid) {
    var _providerid = bid.providerid;

    return Card(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(children: [
          const SizedBox(height: 10),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('ID:  ${bid.providerid}',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    )),
                // Text('21-4-2021',
                //     style: TextStyle(
                //       fontSize: 14,
                //       fontWeight: FontWeight.w500,
                //       color: Colors.grey[700],
                //     ))
              ]),
          const SizedBox(height: 10),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(bid.ordername,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey[700],
                    )),
                // const Text('21-4-2021',
                //     style: TextStyle(
                //       fontSize: 14,
                //       fontWeight: FontWeight.w300,
                //     ))
              ]),
          const SizedBox(height: 10),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                OutlinedButton(
                    onPressed: () async {
                      final FirebaseAuth auth = FirebaseAuth.instance;
                      final User? user = auth.currentUser;
                      final uid = user!.uid;
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
                        providerid: _providerid,
                        isAssigned: true,
                        // phonenumber: loggedInUser.phonenumber, providername: '${loggedInUser.firstName} ${loggedInUser.secondName}',
                      );

                      assignBid(bid);
                      // FirebaseFirestore.instance
                      //     .collection('orders')
                      //     .doc(bid.providerid)
                      //     .set({
                      //   'orderid': bid.orderid,
                      //   'providerid': user.uid,
                      //   'clientid': bid.clientid,
                      //   'ordername': bid.ordername,
                      //   'orderdescription': bid.orderdescription,
                      //   'orderprice': bid.orderprice,
                      //   'providername': user.displayName,
                      // }, SetOptions(merge: true)).then((value) => {
                      //           Fluttertoast.showToast(
                      //               msg: "Order posted Successfully"),
                      //           Get.to(MyOrdersScreen()),
                      //         });
                    },
                    style: OutlinedButton.styleFrom(
                        primary: Colors.black,
                        side: const BorderSide(color: Colors.black),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14)),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 25, vertical: 5)),
                    child: const Text(
                      "Accept",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                          fontWeight: FontWeight.w600),
                    )),
                ClipRRect(
                  borderRadius: BorderRadius.circular(4),
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    color: Colors.green[300],
                    child: Text('Kshs. ${bid.orderprice}',
                        style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white)),
                  ),
                )
              ]),
          const SizedBox(height: 10),
        ]),
      ),
    );
  }

  Future assignBid(Bid bid) async {
    final assignbid =
        FirebaseFirestore.instance.collection('orders').doc(order.orderid);

    final json = bid.toJson();
    await assignbid.set(json).then((value) => {
          Fluttertoast.showToast(msg: "Order Assigned Successfully"),
          Get.to(const MyOrdersScreen())
        });
  }
}

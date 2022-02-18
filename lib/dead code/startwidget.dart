// import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:get/get.dart';
// import 'package:intl/intl.dart';
// import 'package:twendekaziclient/controllers/order_controller.dart';
// import 'package:twendekaziclient/model/order_model.dart';
// import 'package:twendekaziclient/services/database_service.dart';

// class NewOrderScreen extends StatefulWidget {
//   const NewOrderScreen({Key? key}) : super(key: key);

//   @override
//   _NewOrderScreenState createState() => _NewOrderScreenState();
// }

// class _NewOrderScreenState extends State<NewOrderScreen> {
//   // final orderController orderController = Get.find();
//   final OrderController orderController = Get.put(OrderController());
//   Ordercategory _ordercategory = Ordercategory.laundry;
//   DateTime _dueDate = DateTime.now();
//   TimeOfDay _timeOfDay = TimeOfDay.now();

//   DatabaseService database = DatabaseService();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           backgroundColor: Colors.white,
//           leading: Builder(
//             builder: (BuildContext context) {
//               return IconButton(
//                 icon: const Icon(Icons.arrow_back),
//                 onPressed: () {
//                   Get.back();
//                 },
//               );
//             },
//           ),
//           title: const Text('Create Order',
//               style: TextStyle(
//                 fontSize: 20,
//                 fontWeight: FontWeight.bold,
//               )),
//           centerTitle: true,
//           elevation: 0.0,
//           foregroundColor: Colors.black,
//           actions: [
//             IconButton(
//                 onPressed: () {}, icon: const Icon(Icons.drag_indicator_sharp))
//           ],
//         ),
//         bottomNavigationBar: BottomAppBar(
//             child: Container(
//                 padding:
//                     const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//                 child: Row(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Material(
//                         elevation: 5,
//                         borderRadius: BorderRadius.circular(10),
//                         color: Colors.black,
//                         child: MaterialButton(
//                             padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
//                             minWidth: MediaQuery.of(context).size.width * 0.5,
//                             onPressed: () async {
                              
//                             },
//                             // updateLocation;
//                             // Get.to(const LoginScreen());
//                             child: const Text(
//                               "POST ORDER",
//                               textAlign: TextAlign.center,
//                               style: TextStyle(
//                                   fontSize: 16,
//                                   color: Colors.white,
//                                   fontWeight: FontWeight.bold),
//                             )),
//                       ),
//                     ]))),
//         body: const SingleChildScrollView());
//   }
// }



// // print(orderController.neworder);
//                         // database.addorder(order(
//                         //   ordername: orderController.neworder['id'],
//                         //   orderid:
//                         //       int.parse(orderController.neworder['id']),
//                         //   orderdescription:
//                         //       orderController.neworder['description'],
//                         //   orderprice: orderController.neworder['price'],
//                         //   // ordercreatedAt: orderController
//                         //   // .neworder['ordercreatedAt']
//                         // ));
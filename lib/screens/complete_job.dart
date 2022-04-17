import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutterwave/flutterwave.dart';
import 'package:twendekaziclient/model/bids_model.dart';
import 'package:twendekaziclient/model/order_model.dart';
import 'package:twendekaziclient/model/user_model.dart';

class CompleteJob extends StatelessWidget {
  final Order order;
  final Bid bid;

  const CompleteJob({Key? key, required this.order, required this.bid})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Material(
          borderRadius: BorderRadius.circular(10),
          color: Colors.green,
          child: MaterialButton(
              padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
              minWidth: MediaQuery.of(context).size.width * 0.9,
              onPressed: () async {
                try {
                  UserModel loggedInUser = UserModel();
                  Flutterwave flutterwave = Flutterwave.forUIPayment(
                      //the first 10 fields below are required/mandatory
                      context: context,
                      fullName: "Twendekazi Payment",
                      phoneNumber: bid.orderdescription,
                      email: "judefabiano99@gmail.com",
                      amount: "${bid.orderprice}",
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
              },
              child: const Text(
                'COMPLETE PAYMENT',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              )),
        ),
      ),
    );
  }

  // Future<void> _flutterwavepay() async {
  //   try {
  //     Flutterwave flutterwave = Flutterwave.forUIPayment(
  //         //the first 10 fields below are required/mandatory
  //         context: context,
  //         fullName: bid.providername,
  //         phoneNumber: phone,
  //         email: email,
  //         amount: amount,
  //         //Use your Public and Encription Keys from your Flutterwave account on the dashboard
  //         encryptionKey: "FLWSECK_TESTdcbbcedcb159",
  //         publicKey: "FLWPUBK_TEST-bca16c1df40dad9a9d36254c8e7927b4-X",
  //         currency: "KES",
  //         txRef: DateTime.now().toIso8601String(),
  //         //Setting DebugMode below to true since will be using test mode.
  //         //You can set it to false when using production environment.
  //         isDebugMode: true,
  //         //configure the the type of payments that your business will accept
  //         acceptCardPayment: false,
  //         acceptUSSDPayment: false,
  //         acceptAccountPayment: false,
  //         acceptFrancophoneMobileMoney: false,
  //         acceptGhanaPayment: false,
  //         acceptMpesaPayment: true,
  //         acceptRwandaMoneyPayment: false,
  //         acceptUgandaPayment: false,
  //         acceptZambiaPayment: false);

  //     final response = await flutterwave.initializeForUiPayments();
  //     if (response == null) {
  //       print("Transaction Failed");
  //     } else {
  //       if (response.status == "Transaction successful") {
  //         print(response.data);
  //         print(response.message);
  //       } else {
  //         print(response.message);
  //       }
  //     }
  //   } catch (error) {
  //     print(error);
  //     // Fluttertoast.showToast(msg: error);
  //   }
  // }
}

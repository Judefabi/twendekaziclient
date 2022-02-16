// import 'dart:convert';
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

enum Ordercategory {laundry, plumbing, electrical, carrepair,}

class Order extends Equatable {
  final String ordername;
  final String orderid;
  final String orderdescription;
  double orderprice;
  final String orderdetails;
  final DateTime ordercreatedAt;
  final Ordercategory ordercategory;


  Order({
    required this.ordername,
    required this.orderid,
    required this.orderdescription,
    this.orderprice = 0,
    required this.orderdetails,
    required this.ordercreatedAt,
    required this.ordercategory,
  });

  @override
  List<Object> get props {
    return [
      ordername,
      orderid,
      orderdescription,
      orderprice,
      orderdetails,
      ordercreatedAt,
      ordercategory
    ]; 
  }

  Order copyWith({
    String? ordername,
    String? orderid,
    String? orderdescription,
    double? orderprice,
    String? orderdetails,
    DateTime? ordercreatedAt,
    Ordercategory? ordercategory,
  }) {
    return Order(
        ordername: ordername ?? this.ordername,
        orderid: orderid ?? this.orderid,
        orderdescription: orderdescription ?? this.orderdescription,
        orderprice: orderprice ?? this.orderprice,
        orderdetails: orderdetails ?? this.orderdetails,
        ordercreatedAt: ordercreatedAt ?? this.ordercreatedAt,
        ordercategory: ordercategory ?? this.ordercategory
        );
  }

  Map<String, dynamic> toMap() {
    return {
      'ordername': ordername,
      'orderid': orderid,
      'orderdescription': orderdescription,
      'orderprice': orderprice,
      'orderdetails': orderdetails,
      'ordercreatedAt': ordercreatedAt,
      'ordercategory' : ordercategory,
    };
  }

  factory Order.fromSnapshot(DocumentSnapshot snap) {
    return Order(
        ordername: snap['ordername'],
        orderid: snap['orderid'],
        orderdescription: snap['orderdescription'],
        orderprice: snap['orderprice'],
        orderdetails: snap['orderdetails'],
        ordercreatedAt: snap['ordercreatedAt'],
        ordercategory: snap['ordercategory']
        );
  }
  String toJson() => json.encode(toMap());

  

  
}

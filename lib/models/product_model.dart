// import 'dart:convert';
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class Product extends Equatable {
  // final String uproductid;
  final String productname;
  final int productid;
  final String productdescription;
  double productprice;
  // final DateTime productcreatedAt;

  Product({
    // required this.uproductid,
    required this.productname,
    required this.productid,
    // this.productid = DateTime.now().toString(),
    required this.productdescription,
    this.productprice = 0,
    // required this.productcreatedAt,
  });

  @override
  List<Object> get props {
    return [
      productname,
      productid,
      productdescription,
      productprice,
      // productcreatedAt
    ]; //uproductid
  }

  Product copyWith({
    // String? uproductid,
    String? productname,
    int? productid,
    String? productdescription,
    double? productprice,
    // DateTime? productcreatedAt,
  }) {
    return Product(
        // uproductid: uproductid ?? this.uproductid,
        productname: productname ?? this.productname,
        productid: productid ?? this.productid,
        productdescription: productdescription ?? this.productdescription,
        productprice: productprice ?? this.productprice,
        // // // productcreatedAt: productcreatedAt ?? this.productcreatedAt
        );
  }

  Map<String, dynamic> toMap() {
    return {
      // 'uproductid': uproductid,
      'productname': productname,
      'productid': productid,
      'productdescription': productdescription,
      'productprice': productprice,
      // // 'productcreatedAt': productcreatedAt,
    };
  }

  factory Product.fromSnapshot(DocumentSnapshot snap) {
    return Product(
        // uproductid: snap['uproductid'],
        productname: snap['productname'],
        productid: snap['productid'],
        productdescription: snap['productdescription'],
        productprice: snap['productprice'],
        // // productcreatedAt: snap['productcreatedAt']
        );
  }
  String toJson() => json.encode(toMap());

  // factory Product.fromJson(String source) =>
  //     Product.fromMap(json.decode(source));

  @override
  bool get stringify => true;

  static List<Product> product = [
    Product(
      // uproductid: '1',
      productid: 1,
      productdescription: 'Lorem ipsum inscapeduc lorem lorem',
      productprice: 500,
      productname: 'Laundry',
      // productcreatedAt: DateTime.now(),
    ),
    Product(
      // uproductid: '1',
      productid: 2,
      productdescription: 'Lorem ipsum inscapeduc lorem lorem',
      productprice: 300,
      productname: 'Utensils',
      // productcreatedAt: DateTime.now(),
    ),
    Product(
      // uproductid: '2',
      productid: 3,
      productdescription: 'Lorem ipsum inscapeduc lorem lorem',
      productprice: 250,
      productname: 'House Cleaning',
      // productcreatedAt: DateTime.now(),
    ),
    Product(
      // uproductid: '3',
      productid: 4,
      productdescription: 'Lorem ipsum inscapeduc lorem lorem',
      productprice: 300,
      productname: 'Slashing',
      // productcreatedAt: DateTime.now(),
    ),
    Product(
      // uproductid: '4',
      productid: 5,
      productdescription: 'Lorem ipsum inscapeduc lorem lorem',
      productprice: 100,
      productname: 'Laundry',
      // productcreatedAt: DateTime.now(),
    )
  ];
}

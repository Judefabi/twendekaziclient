import 'package:equatable/equatable.dart';
import 'package:uuid/uuid.dart';
// var uuid = const Uuid();

class Bid {
  final String ordername;
  // final String orderid;
  String orderid = const Uuid().v1();
  final String orderdescription;
  double orderprice;
  final String orderdetails;
  DateTime ordercreatedAt = DateTime.now();
  final String ordercategory;
  final String orderownerid;
  DateTime orderdate;
  String providerid;
  bool isAssigned;
  // int? phonenumber;
  // String providername;

  Bid({
    required this.ordername,
    required this.orderid,
    required this.orderdescription,
    this.orderprice = 0,
    required this.orderdetails,
    required this.ordercreatedAt,
    required this.ordercategory,
    required this.orderownerid,
    required this.orderdate,
    required this.providerid,
    required this.isAssigned,
    // required this.phonenumber,
    // required this.providername,
  });

  // @override
  // List<Object> get props {
  //   return [
  //     ordername,
  //     orderid,
  //     orderdescription,
  //     orderprice,
  //     orderdetails,
  //     ordercreatedAt,
  //     ordercategory,
  //     orderownerid,
  //     orderdate,
  //     providerid,
  //     isAssigned,
  // phonenumber,
  //   ];
  // }

  Map<String, dynamic> toJson() => {
        'ordername': ordername,
        'orderid': orderid,
        'orderdescription': orderdescription,
        'orderprice': orderprice,
        'orderdetails': orderdetails,
        'ordercreatedAt': ordercreatedAt,
        'ordercategory': ordercategory,
        'orderownerid': orderownerid,
        'orderdate': orderdate,
        'providerid': providerid,
        'isAssigned': isAssigned,
        // // 'phonenumber': phonenumber,
        // // 'providername': providername,
      };

  static Bid fromJson(Map<String, dynamic> json) => Bid(
      ordername: json['ordername'],
      orderid: json['orderid'],
      orderdescription: json['orderdescription'],
      orderprice: json['orderprice'],
      orderdetails: json['orderdetails'],
      ordercreatedAt: json['ordercreatedAt'].toDate(),
      ordercategory: json['ordercategory'],
      orderownerid: json['orderownerid'],
      orderdate: json['orderdate'].toDate(),
      providerid: json['providerid'],
      isAssigned: json['isAssigned']);
  // // providername: json['providername'],
  // // phonenumber: json['phonenumber']);
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:twendekaziclient/dead%20code/order_model.dart';
import 'package:twendekaziclient/model/order_model.dart';
import 'package:twendekaziclient/model/user_model.dart';

class DatabaseService {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  User? user = FirebaseAuth.instance.currentUser;
  UserModel loggedInUser = UserModel();
  
  Stream<List<Order>> getProducts() {
    return _firebaseFirestore
        .collection('products')
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((doc) => Order.fromSnapshot(doc)).toList();
    });
  }

  // Future<void> addProduct(Product product) {
  //   return _firebaseFirestore.collection('products').add(product.toMap());
  // }

  // Future<void> updateField(Product product, String field, dynamic newValue) {
  //   return _firebaseFirestore
  //       .collection('products')
  //       .where(user!.uid, isEqualTo: product.productid) //and that frineds!! is how we get a single user's order
  //       .get()
  //       .then((querySnapshot) => {
  //             querySnapshot.docs.first.reference.update({field: newValue})
  //           });
  // }

  Stream<List<Order>> getOrders() {
    return _firebaseFirestore.collection('orders').snapshots().map((snapshot) {
      return snapshot.docs.map((doc) => Order.fromSnapshot(doc)).toList();
    });
  }

  // Future<void> updateOrder(Order order, String field, dynamic newValue) {
  //   return _firebaseFirestore
  //       .collection('orders')
  //       .where('id', isEqualTo: order.id)
  //       .get()
  //       .then((querySnapshot) => {
  //             querySnapshot.docs.first.reference.update({field: newValue})
  //           });
  // }F

  // Stream<List<Order>> getpendingOrders() {
  //   return _firebaseFirestore
  //       .collection('orders')
  //       .where('isDelivered', isEqualTo: false)
  //       .where('isCancelled', isEqualTo: false)
  //       .snapshots()
  //       .map((snapshot) {
  //     return snapshot.docs.map((doc) => Order.fromSnapshot(doc)).toList();
  //   });
  // }
}

import 'package:get/get.dart';
import 'package:twendekaziclient/model/order_model.dart';
import 'package:twendekaziclient/services/database_service.dart';

class OrderController extends GetxController {
  final DatabaseService database = DatabaseService();

  var orders = <Order>[].obs;
  var pendingOrders = <Order>[].obs;

  @override
  void onInit() {
    // orders.bindStream(database.getOrders());
    // pendingOrders.bindStream(database.getpendingOrders());
    super.onInit();
  }

  // void updateOrder(
  //   Order order,
  //   String field,
  //   bool value,
  // ) {
  //   database.updateOrder(order, field, value);
  // }
}

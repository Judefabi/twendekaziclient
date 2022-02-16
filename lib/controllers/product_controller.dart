import 'package:get/get.dart';
import 'package:twendekaziclient/model/order_model.dart';
import 'package:twendekaziclient/services/database_service.dart';

class ProductController extends GetxController {
  // List<Product> products = Product.products.obs;
  final DatabaseService database = DatabaseService();

  var orders = <Order>[].obs;

  @override
  void onInit() {
    // orders.bindStream(database.getProducts());
    super.onInit();
  }

  var newProduct = {}.obs;

  get price => newProduct['price'];


}

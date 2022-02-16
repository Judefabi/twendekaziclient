import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:twendekaziclient/controllers/Order_controller.dart';
import 'package:twendekaziclient/model/order_model.dart';

// import 'package:twendekaziclient/screens/orders_screen.dart';
// import 'package:twendekaziclient/screens/orders_screen_check.dart';

class MyOrdersScreen extends StatelessWidget {
  MyOrdersScreen({Key? key}) : super(key: key);
  final OrderController orderController = Get.put(OrderController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Services'),
        backgroundColor: Colors.black,
      ),
      body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 100,
                child: Card(
                    margin: EdgeInsets.zero,
                    color: Colors.black,
                    child: Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            // Get.to(() => NewOrderScreen());
                          },
                          icon: const Icon(
                            Icons.add_circle_outline,
                            color: Colors.white,
                          ),
                        ),
                        const Text(
                          'Add a new Service',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            // Get.to(() => OrdersScreenCheck());
                          },
                          icon: const Icon(
                            Icons.add_circle_outline,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    )),
              ),
              Expanded(
                child: Obx(
                  () => ListView.builder(
                    itemCount: orderController.orders.length,
                    itemBuilder: (context, index) {
                      return SizedBox(
                          height: 210,
                          child: OrderCard(
                            order: orderController.orders[index],
                            index: index,
                          ));
                    },
                  ),
                ),
              )
            ],
          )),
    );
  }
}

class OrderCard extends StatelessWidget {
  final Order order;
  final int index;

  OrderCard({Key? key, required this.order, required this.index})
      : super(key: key);

  final OrderController orderController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Card(
        margin: const EdgeInsets.only(top: 10),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              const Text('order.ordername',
                  style: TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold)),
              const Text('order.orderdescription',
                  style: TextStyle(
                      fontSize: 12, fontWeight: FontWeight.normal)),
              Expanded(
                child: Row(
                  children: const [
                    SizedBox(
                      width: 50,
                      child: Text('Price',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold)),
                    ),
                    // SizedBox(
                    //   width: 175,
                    //   child: Slider(
                    //     value: 'order.orderprice',
                    //     onChanged: (value) {
                    //       // OrderController.updateOrderPrice(
                    //       //     index, Order, value);
                    //     },
                    //     min: 0,
                    //     max: 500,
                    //     divisions: 10,
                    //     activeColor: Colors.black,
                    //     inactiveColor: Colors.black12,
                    //     onChangeEnd: (value) {
                    //       // OrderController.saveNewOrderPrice(
                    //       //     Order, 'price', value);
                    //     },
                    //   ),
                    // ),
                    Text('{Order.Orderprice.toStringAsFixed(1)}',
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.bold))
                  ],
                ),
              )
            ],
          ),
        ));
  }
}

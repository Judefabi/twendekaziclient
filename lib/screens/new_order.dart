import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:twendekaziclient/controllers/order_controller.dart';
import 'package:twendekaziclient/model/order_model.dart';
import 'package:twendekaziclient/services/database_service.dart';

class NewOrderScreen extends StatelessWidget {
  NewOrderScreen({Key? key}) : super(key: key);
  // final orderController orderController = Get.find();
  final OrderController orderController = Get.put(OrderController());

  DatabaseService database = DatabaseService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('New Job'),
        backgroundColor: Colors.black,
      ),
      body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Obx(
            () => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                
                const SizedBox(height: 20),
                const Text(
                  'Order Overview:',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                _buildTextFormField('Order title', 'name', orderController),
                const SizedBox(height: 10),
                // _buildTextFormField('order ID', 'id', orderController),
                _buildTextFormField(
                    'Order Description', 'description', orderController),
                const SizedBox(height: 10),
                const Text('Requirements', style: TextStyle(
                  fontSize: 20, fontWeight: FontWeight.bold
                )),
                _buildTextFormField(
                    'Order Details', 'details', orderController),
                  const SizedBox(height: 10,),
                const Text('Select Category', style: TextStyle(
                  fontSize: 20, fontWeight: FontWeight.bold
                )),
                const OrderCategory(),
                const SizedBox(height: 20),
                const Text('Select Price', style: TextStyle(
                  fontSize: 20, fontWeight: FontWeight.bold
                )),
                _buildSlider('Price', 'price', orderController,
                    orderController.price),
                const SizedBox(
                  height: 50,
                ),
                Center(
                  child: ElevatedButton(
                      onPressed: () {
                        
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.black,
                      ),
                      child: const Text(
                        'Save',
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
                      )),
                )
              ],
            ),
          )),
    );
  }

  Row _buildSlider(String title, String name,
      OrderController orderController, double? controllerValue) {
    return Row(
      children: [
        const SizedBox(
          width: 75,
          child: Text(
            'Price',
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          ),
        ),
        Expanded(
          child: Slider(
            value: (controllerValue == null) ? 0 : controllerValue,
            onChanged: (value) {
              orderController.newOrder.update(
                name,
                (_) => value,
                ifAbsent: () => value,
              );
            },
            min: 0,
            max: 500,
            divisions: 10,
            activeColor: Colors.black,
            inactiveColor: Colors.black12,
          ),
        ),
      ],
    );
  }

  TextFormField _buildTextFormField(
    String hintText,
    String name,
    OrderController orderController,
  ) {
    return TextFormField(
      decoration: InputDecoration(hintText: hintText),
      onChanged: (value) {
        orderController.newOrder
            .update(name, (_) => value, ifAbsent: () => value);
      },
    );
  }

  

}


class OrderCategory extends StatefulWidget {
  const OrderCategory({Key? key}) : super(key: key);

  @override
  _OrderCategoryState createState() => _OrderCategoryState();
}

class _OrderCategoryState extends State<OrderCategory> {
  @override
  Widget build(BuildContext context){
    var ordercategory;
    return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Wrap(
        spacing: 10.0,
        children: [
          // 4
          ChoiceChip(
            // 5
            selectedColor: Colors.black,
            // 6
            selected: ordercategory == Ordercategory.laundry,
            label: const Text(
              'Laundry',
              style: TextStyle(color: Colors.white),),
            // 7
            onSelected: (selected) {
              setState(() => ordercategory = Ordercategory.laundry);
            },),
          ChoiceChip(
            selectedColor: Colors.black,
            selected: ordercategory == Ordercategory.plumbing,
            label: const Text(
              'Plumbing',
              style: TextStyle(color: Colors.white),),
            onSelected: (selected) {
              setState(() => ordercategory = Ordercategory.plumbing);
            },),
          ChoiceChip(
            selectedColor: Colors.black,
            selected: ordercategory == Ordercategory.electrical,
            label: const Text(
              'Electrical',
              style: TextStyle(color: Colors.white),),
            onSelected: (selected) {
              setState(() => ordercategory = Ordercategory.electrical);
            },),
          ChoiceChip(
            selectedColor: Colors.black,
            selected: ordercategory == Ordercategory.carrepair,
            label: const Text(
              'Car Repair',
              style: TextStyle(color: Colors.white),),
            onSelected: (selected) {
              setState(() => ordercategory = Ordercategory.carrepair);
            },),
        ],)
    ],);
  }
}



// print(orderController.neworder);
                        // database.addorder(order(
                        //   ordername: orderController.neworder['id'],
                        //   orderid:
                        //       int.parse(orderController.neworder['id']),
                        //   orderdescription:
                        //       orderController.neworder['description'],
                        //   orderprice: orderController.neworder['price'],
                        //   // ordercreatedAt: orderController
                        //   // .neworder['ordercreatedAt']
                        // ));
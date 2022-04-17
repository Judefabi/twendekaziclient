import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:twendekaziclient/controllers/order_controller.dart';
import 'package:twendekaziclient/model/order_model.dart';
import 'package:twendekaziclient/model/user_model.dart';
import 'package:twendekaziclient/screens/myorders_screen.dart';
import 'package:twendekaziclient/services/database_service.dart';
import 'package:uuid/uuid.dart';

class NewOrderScreen extends StatefulWidget {
  const NewOrderScreen({Key? key}) : super(key: key);

  @override
  _NewOrderScreenState createState() => _NewOrderScreenState();
}

class _NewOrderScreenState extends State<NewOrderScreen> {
  // final orderController orderController = Get.find();
  final OrderController orderController = Get.put(OrderController());

  //Text Controllers
  final titleFieldController = TextEditingController();
  final descriptionFieldController = TextEditingController();
  final detailsFieldController = TextEditingController();

  //Firestore
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;

  //input variables
  DateTime _orderDate = DateTime.now();
  DateTime _currentDate = DateTime.now();
  TimeOfDay _timeOfDay = TimeOfDay.now();
  double priceValue = 0;
  // var uuid = const Uuid();
  String orderid = const Uuid().v1();

  //List for category choicechips
  late int defaultCategoryChoice;
  String selectedOrderCategory = '';
  final List<String> _categoryList = [
    'Plumbing',
    'Laundry',
    'Car repair',
    'Electrical'
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    defaultCategoryChoice = 0;
  }

  // DatabaseService database = DatabaseService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                Get.back();
              },
            );
          },
        ),
        title: const Text('Create Order',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            )),
        centerTitle: true,
        elevation: 0.0,
        foregroundColor: Colors.black,
        actions: [
          IconButton(
              onPressed: () {}, icon: const Icon(Icons.drag_indicator_sharp))
        ],
      ),
      bottomNavigationBar: BottomAppBar(
          child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Material(
                      elevation: 5,
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.black,
                      child: MaterialButton(
                          padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
                          minWidth: MediaQuery.of(context).size.width * 0.5,
                          onPressed: () async {
                            // String orderid = const Uuid().v1();
                            User? user = _auth.currentUser;
                            UserModel loggedInUser = UserModel();
                            // _saveOrder();
                            final order = Order(
                              ordername: titleFieldController.text,
                              orderid: orderid,
                              orderdescription: descriptionFieldController.text,
                              orderdetails: detailsFieldController.text,
                              ordercreatedAt: _currentDate,
                              ordercategory: selectedOrderCategory,
                              orderdate: _orderDate,
                              orderownerid: user!.uid,
                              orderprice: priceValue,
                              providerid: 'twendekazi',
                              isAssigned: false,
                            );

                            postOrder(order);
                          },

                          // updateLocation;
                          // Get.to(const LoginScreen());
                          child: const Text(
                            "POST ORDER",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          )),
                    ),
                  ]))),
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            const Text(
              'Order Overview:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            _buildTitleField('Order title'),
            const SizedBox(height: 10),
            // _buildTextFormField('order ID', 'id', orderController),
            _buildDescriptionField(
              'Phone Number',
            ),
            const SizedBox(height: 10),
            const Text('Requirements',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            _buildTextFormFieldDetails(
              'Order Details',
            ),
            // const Text('Select Date',
            //     style:
            //         TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            _buildDate(context),
            const SizedBox(height: 20),
            // const Text('Select Time',
            //     style:
            //         TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            _buildTime(context),
            const SizedBox(
              height: 10,
            ),
            const Text('Select Category',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            // const OrderCategory(),
            const SizedBox(height: 10),
            // buildOrderCategory(),
            _buildCategoryChips(),
            const SizedBox(height: 20),
            const Text('Select Price',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            _buildSlider(),
          ],
        ),
      )),
    );
  }

  Row _buildSlider() {
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
            value: priceValue,
            onChanged: (value) => setState(() => this.priceValue = value),
            min: 0,
            max: 2500,
            divisions: 10,
            label: priceValue.round().toString(),
            activeColor: Colors.black,
            inactiveColor: Colors.black12,
            // label: {'$controllerValue'},
          ),
        ),
      ],
    );
  }

  TextFormField _buildTitleField(
    String hintText,
  ) {
    return TextFormField(
        controller: titleFieldController,
        decoration: InputDecoration(
          hintText: hintText,
        ));
  }

  TextFormField _buildDescriptionField(
    String hintText,
  ) {
    return TextFormField(
        controller: descriptionFieldController,
        decoration: InputDecoration(
          hintText: hintText,
        ));
  }

  TextFormField _buildTextFormFieldDetails(
    String hintText,
  ) {
    return TextFormField(
      decoration: InputDecoration(hintText: hintText),
      controller: detailsFieldController,
      maxLines: 5,
    );
  }

  Widget _buildDate(BuildContext context) {
    // 1
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // 2
        Row(
          // 3
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // 4
            const Text(
              'Date',
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            // 5
            TextButton(
              child: const Text('Select'),
              // 6
              onPressed: () async {
                final currentDate = DateTime.now();
                // 7
                final selectedDate = await showDatePicker(
                  context: context,
                  initialDate: currentDate,
                  firstDate: currentDate,
                  lastDate: DateTime(currentDate.year + 5),
                );
                // 8
                setState(() {
                  if (selectedDate != null) {
                    _orderDate = selectedDate;
                  }
                });
              },
            ),
          ],
        ),
        // 9
        if (_orderDate != null)
          Text('${DateFormat('yyyy-MM-dd').format(_orderDate)}'),
      ],
    );
  }

  Widget _buildTime(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          const Text(
            'Time of Day',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          TextButton(
            child: const Text('Select'),
            onPressed: () async {
              // 1
              final timeOfDay = await showTimePicker(
                // 2
                initialTime: TimeOfDay.now(),
                context: context,
              );

              // 3
              setState(() {
                if (timeOfDay != null) {
                  _timeOfDay = timeOfDay;
                }
              });
            },
          ),
        ]),
        if (_timeOfDay != null) Text('${_timeOfDay.format(context)}'),
      ],
    );
  }

  Widget _buildCategoryChips() {
    return Wrap(
      spacing: 10.0,
      children: List.generate(_categoryList.length, (index) {
        return ChoiceChip(
          labelPadding: const EdgeInsets.fromLTRB(5.0, 2.0, 5.0, 2.0),
          label: Text(
            _categoryList[index],
            style: const TextStyle(color: Colors.white),
          ),
          selected: defaultCategoryChoice == index,
          selectedColor: Colors.black,
          onSelected: (value) {
            setState(() {
              defaultCategoryChoice = value ? index : defaultCategoryChoice;
              selectedOrderCategory = _categoryList[index];
            });
          },
          // backgroundColor: color,
          elevation: 1,
          // padding: EdgeInsets.symmetric(
          //     horizontal: SizeConfig.widthMultiplier * 4),
        );
      }),
    );
  }

  Future postOrder(Order order) async {
    final orderPost =
        FirebaseFirestore.instance.collection('orders').doc(orderid);

    final json = order.toJson();
    await orderPost.set(json).then((value) => {
          Fluttertoast.showToast(msg: "Order posted Successfully"),
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => const MyOrdersScreen())),
        });
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
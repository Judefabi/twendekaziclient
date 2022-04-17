import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:twendekaziclient/screens/home/components/categories.dart';
import 'package:twendekaziclient/screens/home/components/discount_banner.dart';
import 'package:twendekaziclient/screens/home/components/home_header.dart';
import 'package:twendekaziclient/screens/home/components/popular_product.dart';
import 'package:twendekaziclient/screens/home/components/special_offers.dart';
import 'package:twendekaziclient/screens/new_order.dart';

class HomeScreen extends StatelessWidget {
  static String routeName = "/home";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Get.to(const NewOrderScreen());
          },
          backgroundColor: const Color(0xFF4A3298),
          child: const Icon(Icons.work_rounded, color: Colors.white)),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              height: 25,
            ),

            // const SizedBox(
            //   height: 55,
            // ),
            const SizedBox(height: 20),
            const HomeHeader(),
            const SizedBox(height: 10),
            const DiscountBanner(),
            Categories(),
            const SpecialOffers(),
            const SizedBox(height: 30),
            PopularProducts(),
            const SizedBox(height: 30),
          ],
        ),
      ),
      // bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.home),
    );
  }
}

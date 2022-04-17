import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:twendekaziclient/screens/new_order.dart';
import 'package:twendekaziclient/screens/registration_screen.dart';

class EmptyJobsScreen extends StatefulWidget {
  const EmptyJobsScreen({Key? key}) : super(key: key);

  @override
  _EmptyJobsScreenState createState() => _EmptyJobsScreenState();
}

class _EmptyJobsScreenState extends State<EmptyJobsScreen> {
  
  var image = "assets/images/map.png";
  var text = "Seems you dont have any work,\n Want to create a new order? /n ";
  var title = "No Orders";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [

          
          PageContent(),
          
          Container(
            alignment: const Alignment(0, 0.95),
            child: Material(
              borderRadius: BorderRadius.circular(10),
              color: Colors.grey,
              child: MaterialButton(
                  padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
                  minWidth: MediaQuery.of(context).size.width * 0.9,
                  onPressed: () {
                    Get.to(const NewOrderScreen());
                  },
                  child: const Text(
                    'POST ORDER',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  )),
            ),
          ),
        ],
      ),
    );
  }
}

class PageContent extends StatefulWidget {
  PageContent({Key? key,}) : super(key: key);

  @override
  State<PageContent> createState() => _PageContentState();
}

class _PageContentState extends State<PageContent> {
  var image = "assets/images/map.png";
  var text = "Seems you dont have any work,\n Want to create a new order? /n ";
  var title = "No Orders";
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // AspectRatio(
            //   aspectRatio: 16 / 9,
            //   child: Image.asset(widget.image),
            // ),
            Center(
              child: Image.asset(image,
                  height: MediaQuery.of(context).size.height * 0.5,
                  width: MediaQuery.of(context).size.width),
            ),
            const SizedBox(height: 8.0),
            Text(
              title,
              style: GoogleFonts.oswald(
                color: Colors.black,
                fontSize: 30,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 16.0),
            Text(
             text,
              textAlign: TextAlign.center,
              style: GoogleFonts.roboto(
                color: Colors.black,
                fontSize: 16
                // fontWeight: FontWeight.w400,
              ),
            ),

            const SizedBox(height: 25),
          ],
        ),
      ),
    );
  }
}

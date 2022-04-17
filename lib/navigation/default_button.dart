import 'package:flutter/material.dart';

class DefaultButton extends StatelessWidget {
  var buttontext;

  final GestureTapCallback onPressed;

  DefaultButton({
    Key? key,
    this.buttontext,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(10),
      color: Colors.black,
      child: MaterialButton(
          padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          minWidth: MediaQuery.of(context).size.width * 0.5,
          onPressed: () {
            // buttonfunction;
          },
          // updateLocation;
          // Get.to(const LoginScreen());
          child: Text(
            buttontext,
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 16, color: Colors.white, fontWeight: FontWeight.bold),
          )),
    );
  }
}

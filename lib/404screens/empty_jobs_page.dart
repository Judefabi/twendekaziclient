import 'package:flutter/material.dart';

class EmptyJobsScreen extends StatefulWidget {
  const EmptyJobsScreen({Key? key}) : super(key: key);

  @override
  _EmptyJobsScreenState createState() => _EmptyJobsScreenState();
}

class _EmptyJobsScreenState extends State<EmptyJobsScreen> {
  @override
  Widget build(BuildContext context){
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AspectRatio(
              aspectRatio: 1/1,child: Image.asset('assets\emptyjobspage.png'),),
              const SizedBox(height: 8.0),
              const Text('Hello Employer', style: TextStyle(fontSize: 21)),
              const SizedBox(height: 16.0),
              const Text('Looking to employ?\n'
              'Tap the + button to Post',textAlign: TextAlign.center ),
              Material(
                        elevation: 5,
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.black,
                        child: MaterialButton(
                            padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
                            minWidth: MediaQuery.of(context).size.width * 0.5,
                            onPressed: ()  {
                              
                            },
                            // updateLocation;
                            // Get.to(const LoginScreen());
                            child: const Text(
                              "POST JOB", 
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            )),
                      ),
          ]
        )
      )
    );
  }
}
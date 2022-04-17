import 'package:equatable/equatable.dart';

class Provider extends Equatable {
  final String uid;
  final String email;
  final String firstName;
  final String secondName;
  Provider({
    required this.uid,
    required this.email,
    required this.firstName,
    required this.secondName,
  });
  @override
  List<Object> get props {
    return [
      uid,
      firstName,
      secondName,
      email,
    ];
  }
  // Provider({this.uid, this.email, this.firstName, this.secondName});

  // receiving data from server
  

  // sending data to our server
  Map<String, dynamic> json() => {
        'uid': uid,
        'email': email,
        'firstName': firstName,
        'secondName': secondName,
      };
  
  static Provider fromJson(Map<String, dynamic> json) => Provider(
        uid: json['uid'],
        email: json['email'],
        firstName: json['firstName'],
        secondName: json['secondName'],
      );
}

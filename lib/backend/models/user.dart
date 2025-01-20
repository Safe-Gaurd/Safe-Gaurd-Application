import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel
{
  final String uid;
  final String name;
  final String email;
  final String phonenumber;
  final String photoURL;

  UserModel({
    required this.uid, 
    required this.name, 
    required this.email, 
    required this.phonenumber,
    required this.photoURL,
    });

    Map<String, dynamic> toMap()
    {
      return {
        'uid': uid,
        'name': name,
        'email': email,
        'phonenumber': phonenumber,
        'photoURL': photoURL,
      };
    }

    static UserModel fromSnapshot(DocumentSnapshot documentSnapshot) {
    var map = documentSnapshot.data() as Map<String, dynamic>;
    
    return UserModel(
      uid: map['uid'],
      name: map['name'],
      email: map['email'],
      phonenumber: map['phonenumber'],
      photoURL: map['photoURL']?? '',);

    }
}
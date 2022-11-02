import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Users with ChangeNotifier {
  final db = FirebaseFirestore.instance;
  TextEditingController firshnameC = TextEditingController();
  TextEditingController lastnamenameC = TextEditingController();
  TextEditingController age = TextEditingController();

  void addUser() {
    CollectionReference users = db.collection("users");

    if (firshnameC.text.isNotEmpty &&
        lastnamenameC.text.isNotEmpty &&
        age.text.isNotEmpty) {
      users.add({
        'firstname': firshnameC.text,
        'lastname': lastnamenameC.text,
        'age': age.text,
      });
      firshnameC.clear();
      lastnamenameC.clear();
      age.clear();
    } else {
      print("Ada Data Yang Kosong....");
    }
  }

  Future<QuerySnapshot<Object?>> getUsers() async {
    CollectionReference users = db.collection("users");

    return await users.get();
  }
}

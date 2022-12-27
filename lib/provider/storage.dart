import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class Storage with ChangeNotifier {
  void UploadFile() async {
    // SIngle Upload
    // FilePickerResult? result = await FilePicker.platform.pickFiles();

    // if (result != null) {
    //   File file = File(result.files.single.path!);

    //   try {
    //     await FirebaseStorage.instance
    //         .ref(result.files.single.name)
    //         .putFile(file);
    //   } on firebase_storage.FirebaseException catch (e) {
    //     print(e);
    //   }
    // } else {
    //   // User canceled the picker
    //   print("Cencel");
    // }

    // Muultiple Upload
    FilePickerResult? result =
        await FilePicker.platform.pickFiles(allowMultiple: true);

    if (result != null) {
      for (var element in result.files) {
        String name = element.name;
        File file = File(element.path!);
        try {
          await FirebaseStorage.instance.ref(name).putFile(file);
        } on firebase_storage.FirebaseException catch (e) {
          print(e);
        }
      }
    } else {
      // User canceled the picker
      print("cencel");
    }
  }
}

import 'package:firebase_app/provider/storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

class UploadScreen extends StatelessWidget {
  const UploadScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Storage storage = Provider.of<Storage>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Upload File"),
      ),
      body: Center(
        child: OutlinedButton(
          child: Text("Upload"),
          onPressed: () {
            storage.UploadFile();
          },
        ),
      ),
    );
  }
}

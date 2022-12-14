import 'dart:html';

import 'package:firebase_app/firebase_options.dart';
import 'package:firebase_app/provider/auth.dart';
import 'package:firebase_app/provider/storage.dart';
import 'package:firebase_app/provider/users.dart';
import 'package:firebase_app/screen/login_screen.dart';
import 'package:firebase_app/screen/upload_screen.dart';
import 'package:firebase_app/screen/user_screeen.dart';
import 'package:firebase_app/screen/wrapper.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => Users(),
          ),
          ChangeNotifierProvider(
            create: (context) => Storage(),
          ),
          ChangeNotifierProvider(
            create: (context) => Auth(),
          ),
        ],
        child: Wrapper(),
      ),
    );
  }
}

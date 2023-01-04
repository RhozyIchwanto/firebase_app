import 'package:firebase_app/provider/auth.dart';
import 'package:firebase_app/screen/register_page.dart';
import 'package:firebase_app/screen/reset_password.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailC = TextEditingController();
    TextEditingController passwordC = TextEditingController();
    Auth auth = Provider.of<Auth>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                controller: emailC,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                controller: passwordC,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      auth.login(emailC.text, passwordC.text);
                    },
                    child: Text("Login"),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ChangeNotifierProvider(
                            create: (context) => Auth(),
                            child: RegisterScreen(),
                          ),
                        ),
                      );
                    },
                    child: Text("Register"),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ChangeNotifierProvider(
                        create: (context) => Auth(),
                        child: ResetPassword(),
                      ),
                    ),
                  );
                },
                child: Text("Reset Password"),
              ),
              SizedBox(
                height: 20,
              ),
              TextButton(
                onPressed: () {
                  // auth.signInWithGoogle();
                },
                child: Text("Sign In With Google Acount"),
              ),
              TextButton(
                onPressed: () {
                  auth.signInWithAnon();
                },
                child: Text("Sign In With Anonymous Acount"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

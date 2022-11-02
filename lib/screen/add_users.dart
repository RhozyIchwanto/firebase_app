import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

import '../provider/users.dart';

class AddUsers extends StatelessWidget {
  const AddUsers({super.key});

  @override
  Widget build(BuildContext context) {
    Users users = Provider.of<Users>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Users"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
              controller: users.firshnameC,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            TextField(
              controller: users.lastnamenameC,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            TextField(
              controller: users.age,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                users.addUser();
              },
              child: Text("Add User"),
            ),
          ],
        ),
      ),
    );
  }
}

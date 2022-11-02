import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_app/provider/users.dart';
import 'package:firebase_app/screen/add_users.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

class UsersScreen extends StatelessWidget {
  const UsersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Users users = Provider.of<Users>(context);
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ChangeNotifierProvider(
                create: (context) => Users(),
                child: AddUsers(),
              ),
            ),
          );
        },
        child: Icon(Icons.add),
      ),
      appBar: AppBar(
        title: Text("Users"),
      ),
      body: FutureBuilder<QuerySnapshot<Object?>>(
        future: users.getUsers(),
        builder: (context, snapshot) {
          // var data = snapshot.data!.docs;
          if (snapshot.connectionState == ConnectionState.done) {
            var data = snapshot.data!.docs;
            return ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                final user = data[index].data() as Map<String, dynamic>;
                return ListTile(
                  title: Text(user['firstname']),
                  subtitle: Text(user['age']),
                );
              },
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}

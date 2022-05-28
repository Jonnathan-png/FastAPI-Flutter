// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_fastmongo/api/my_api.dart';
import 'package:flutter_fastmongo/models/user.dart';
import 'package:flutter_fastmongo/utils/responsive.dart';

class ReadForm extends StatefulWidget {
  const ReadForm({Key? key}) : super(key: key);

  @override
  _ReadFormState createState() => _ReadFormState();
}

class _ReadFormState extends State<ReadForm> {
  List<User> users = [];

  Future<List<User>> _getUsers() async {
    users = await MyAPI.instance.getUsersAll(
      context,
      token: "",
    );
    return users;
  }

  @override
  Widget build(BuildContext context) {

    return Positioned(
      child: FutureBuilder(
          future: _getUsers(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const Text("Loading ...");
            } else {
              return ListView.builder(
                  reverse: true,
                  itemCount: users.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: Column(
                        children: [
                          Text(users[index].id.toString()),
                          Text(users[index].name.toString()),
                          Text(users[index].teams.toString()),
                        ],
                      ),
                    );
                    /*
              return ListTile(
                title: Text('Name:\n'+users[index].name.toString()),
                subtitle: Text('Teams:\n'+users[index].teams.toString()),
                trailing: Text('_Id:\n'+users[index].empid.toString()),
              );
              */
                  });
            }
          }),
    );
  }
}

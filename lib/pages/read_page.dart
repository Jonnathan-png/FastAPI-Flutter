import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fastmongo/api/my_api.dart';
import 'package:flutter_fastmongo/models/user.dart';
import 'package:flutter_fastmongo/pages/home_page.dart';
import 'package:flutter_fastmongo/utils/responsive.dart';
import 'package:flutter_fastmongo/widgets/circle.dart';
import 'package:flutter_fastmongo/widgets/icon_container.dart';
import 'package:flutter_fastmongo/widgets/read_form.dart';

class ReadPage extends StatefulWidget {
  static const String routeName = 'read';

  const ReadPage({Key? key}) : super(key: key);

  @override
  _ReadPageState createState() => _ReadPageState();
}

class _ReadPageState extends State<ReadPage> {
  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive.of(context);

    final double pinkSize = responsive.wp(80);
    final double orangeSize = responsive.wp(57);
    List<User> users = [];

    Future<List<User>> _getUsers() async {
      users = await MyAPI.instance.getUsersAll(
        context,
        token: "",
      );
      return users;
    }

    return Scaffold(
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            height: responsive.height,
            color: Colors.white,
            child: Stack(
              alignment: Alignment.center,
              children: <Widget>[
                Positioned(
                  top: -pinkSize * 0.4,
                  right: -pinkSize * 0.2,
                  child: Circle(
                    size: pinkSize,
                    colors: const [
                      Colors.pinkAccent,
                      Colors.pink,
                    ],
                  ),
                ),
                Positioned(
                  top: -orangeSize * 0.55,
                  left: -orangeSize * 0.15,
                  child: Circle(
                    size: orangeSize,
                    colors: const [
                      Colors.orange,
                      Colors.deepOrangeAccent,
                    ],
                  ),
                ),
                Positioned(
                  top: pinkSize * 0.35,
                  child: Column(
                    children: <Widget>[
                      IconContainer(
                        size: responsive.wp(17),
                      ),
                      SizedBox(
                        height: responsive.dp(3),
                      ),
                      Text(
                        "All Users",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: responsive.dp(1.9),
                        ),
                      )
                    ],
                  ),
                ),
                Positioned(
                  left: 15,
                  top: 10,
                  child: SafeArea(
                    child: CupertinoButton(
                      color: Colors.black26,
                      padding: const EdgeInsets.all(10),
                      borderRadius: BorderRadius.circular(30),
                      child: const Icon(Icons.arrow_back),
                      onPressed: () {
                        Navigator.pushNamedAndRemoveUntil(
                          context,
                          HomePage.routeName,
                          (_) => false,
                        );
                      },
                    ),
                  ),
                ),
                Positioned(
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
                              });
                        }
                      }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

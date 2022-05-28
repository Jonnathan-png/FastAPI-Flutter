// ignore_for_file: must_be_immutable

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fastmongo/api/my_api.dart';
import 'package:flutter_fastmongo/models/user.dart';
import 'package:flutter_fastmongo/pages/home_page.dart';
import 'package:flutter_fastmongo/utils/responsive.dart';
import 'package:flutter_fastmongo/widgets/circle.dart';
import 'package:flutter_fastmongo/widgets/icon_container.dart';

class SearchForm extends StatelessWidget {
  static const String routeName = 'read';
  final String id = '628ed69447845af8b77fa4e0';

  const SearchForm({Key? key, required id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive.of(context);

    final double pinkSize = responsive.wp(80);
    final double orangeSize = responsive.wp(57);
    User? user;
    print("Prueba: "+id);
    Future<User?> _getUser() async {
      user = await MyAPI.instance.getUserOne(
        context,
        id: id,
        token: "",
      );
      return user;
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
                        size: responsive.wp(12),
                      ),
                      SizedBox(
                        height: responsive.dp(3),
                      ),
                      Text(
                        "User",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: responsive.dp(2.4),
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
                  top: pinkSize * 0.85,
                  child: FutureBuilder(
                      future: _getUser(),
                      builder: (context, snapshot) {
                        if (!snapshot.hasData) {
                          return const Text("Loading ...");
                        } else {
                          return Card(
                            child: Column(
                              children: [
                                Text(user!.id.toString()),
                                Text(user!.name.toString()),
                                Text(user!.teams.toString()),
                              ],
                            ),
                          );
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

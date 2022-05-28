import 'package:flutter/material.dart';
import 'package:flutter_fastmongo/utils/responsive.dart';
import 'package:flutter_fastmongo/widgets/circle.dart';
import 'package:flutter_fastmongo/widgets/icon_remove.dart';
import 'package:flutter_fastmongo/widgets/remove_form.dart';

class DeletePage extends StatefulWidget {
  static const routeName = 'delete';
  const DeletePage({Key? key}) : super(key: key);

  @override
  _DeletePageState createState() => _DeletePageState();
}

class _DeletePageState extends State<DeletePage> {

  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive.of(context);

    final double pinkSize = responsive.wp(88);
    final double orangeSize = responsive.wp(57);

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
                  top: -pinkSize * 0.3,
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
                  top: -orangeSize * 0.35,
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
                  top: pinkSize * 0.22,
                  child: Column(
                    children: <Widget>[
                      Text(
                        "Delete User.",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: responsive.dp(1.6), color: Colors.white),
                      ),
                      SizedBox(height: responsive.dp(4.5)),
                      IconRemove(
                        size: responsive.wp(17),
                      )
                    ],
                  ),
                ), 
                Positioned(
                  top: pinkSize * 0.82,
                  child: Column(
                    children: const <Widget>[
                       RemoveForm(),
                    ],
                  ),
                ),
                     
              ],
            ),
          ),
        ),
      ),
    );
  }
}


import 'package:flutter/material.dart';
import 'package:flutter_fastmongo/pages/create_page.dart';
import 'package:flutter_fastmongo/pages/delete_page.dart';
import 'package:flutter_fastmongo/pages/home_page.dart';
import 'package:flutter_fastmongo/pages/login_page.dart';
import 'package:flutter/services.dart';
import 'package:flutter_fastmongo/pages/read_page.dart';
import 'package:flutter_fastmongo/pages/register_page.dart';
import 'package:flutter_fastmongo/pages/update_page.dart';
import 'package:flutter_fastmongo/pages/findOne_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const LoginPage(),
      routes: {
        RegisterPage.routeName: (_) => const RegisterPage(),
        LoginPage.routeName: (_) => const LoginPage(),
        HomePage.routeName: (_) => const HomePage(),
        CreatePage.routeName: (_) => const CreatePage(),
        DeletePage.routeName: (_) => const DeletePage(),
        ReadPage.routeName: (_) => const ReadPage(),
        UpdatePage.routeName: (_) => const UpdatePage(),
        FindOnePage.routeName: (_) => const FindOnePage(),
      },
    );
  }
}

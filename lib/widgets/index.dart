// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_fastmongo/api/my_api.dart';
import 'package:flutter_fastmongo/pages/create_page.dart';
import 'package:flutter_fastmongo/pages/delete_page.dart';
import 'package:flutter_fastmongo/pages/findOne_page.dart';
import 'package:flutter_fastmongo/pages/read_page.dart';
import 'package:flutter_fastmongo/utils/responsive.dart';
import 'package:flutter_fastmongo/pages/update_page.dart';
import 'package:flutter_fastmongo/widgets/search_form.dart';

class IndexForm extends StatefulWidget {
  const IndexForm({Key? key}) : super(key: key);

  @override
  _IndexFormState createState() => _IndexFormState();
}

class _IndexFormState extends State<IndexForm> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  String _username = '', _password = '';

  _submit() {
    final isOk = _formKey.currentState?.validate();
    print("form isOk $isOk");
    if (isOk!) {
      MyAPI.instance.login(context, username: _username, password: _password);
    }
  }

  _getOneUser() {
    final isOk = _formKey.currentState?.validate();
    print("form isOk $isOk");
    if (isOk!) {
      MyAPI.instance.getUsersAll(context, token: _password);
    }
  }

  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive.of(context);

    return Positioned(
      bottom: 30,
      child: Container(
        constraints: BoxConstraints(
          maxWidth: responsive.isTablet ? 430 : 360,
        ),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              SizedBox(height: responsive.dp(5)),
              SizedBox(
                width: double.infinity,
                child: FlatButton(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  child: Text(
                    "Find All Users",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: responsive.dp(1.5),
                    ),
                  ),
                  onPressed: () {
                      Navigator.pushNamedAndRemoveUntil(
                        context,
                        ReadPage.routeName,
                        (_) => false,
                      );
                  },
                  color: Colors.pinkAccent,
                ),
              ),
              SizedBox(height: responsive.dp(2)),
              SizedBox(
                width: double.infinity,
                child: FlatButton(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  child: Text(
                    "Find One User",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: responsive.dp(1.5),
                    ),
                  ),
                  onPressed: () {
                      Navigator.pushNamedAndRemoveUntil(
                        context,
                        FindOnePage.routeName,
                        (_) => false,
                      );
                  },
                  color: Colors.pinkAccent,
                ),
              ),
              SizedBox(height: responsive.dp(2)),
              SizedBox(
                width: double.infinity,
                child: FlatButton(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  child: Text(
                    "Create User",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: responsive.dp(1.5),
                    ),
                  ),
                  onPressed: () {
                      Navigator.pushNamedAndRemoveUntil(
                        context,
                        CreatePage.routeName,
                        (_) => false,
                      );
                  },
                  color: Colors.pinkAccent,
                ),
              ),
              SizedBox(height: responsive.dp(2)),
              SizedBox(
                width: double.infinity,
                child: FlatButton(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  child: Text(
                    "Update User",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: responsive.dp(1.5),
                    ),
                  ),
                  onPressed: () {
                      Navigator.pushNamedAndRemoveUntil(
                        context,
                        UpdatePage.routeName,
                        (_) => false,
                      );
                  },
                  color: Colors.pinkAccent,
                ),
              ),
              SizedBox(height: responsive.dp(2)),
              SizedBox(
                width: double.infinity,
                child: FlatButton(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  child: Text(
                    "Delete User",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: responsive.dp(1.5),
                    ),
                  ),
                  onPressed: () {
                      Navigator.pushNamedAndRemoveUntil(
                        context,
                        DeletePage.routeName,
                        (_) => false,
                      );
                  },
                  color: Colors.pinkAccent,
                ),
              ),
              SizedBox(height: responsive.dp(10)),
            ],
          ),
        ),
      ),
    );
  }
}

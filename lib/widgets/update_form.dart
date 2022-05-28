// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_fastmongo/api/my_api.dart';
import 'package:flutter_fastmongo/utils/responsive.dart';
import 'input_text.dart';

class UpdateForm extends StatefulWidget {
  const UpdateForm({Key? key}) : super(key: key);

  @override
  _UpdateFormState createState() => _UpdateFormState();
}

class _UpdateFormState extends State<UpdateForm> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  String id='', _empid = '', _name = '', _age = '', _teams = '';

  _submit() {
    final isOk = _formKey.currentState?.validate();
    if (isOk!) {
      MyAPI.instance.updateUser(
        context, 
        id: id,
        empid: _empid, 
        name: _name, 
        age: _age,
        teams: _teams,
        token: " ");
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
              InputText(
                keyboardType: TextInputType.emailAddress,
                label: "ID",
                fontSize: responsive.dp(responsive.isTablet ? 1.8 : 1.9),
                onChanged: (text) {
                  id = text;
                },
                validator: (text) {
                  if (text.trim().length == 0) {
                    return "Invalid Id";
                  }
                  return null;
                },
              ),
              SizedBox(height: responsive.dp(2)),
              InputText(
                keyboardType: TextInputType.emailAddress,
                label: "EMP_ID",
                fontSize: responsive.dp(responsive.isTablet ? 1.8 : 1.9),
                onChanged: (text) {
                  _empid = text;
                },
                validator: (text) {
                  if (text.trim().length == 0) {
                    return "Invalid Emp_Id";
                  }
                  return null;
                },
              ),
              SizedBox(height: responsive.dp(2)),
              InputText(
                keyboardType: TextInputType.emailAddress,
                label: "NAME",
                fontSize: responsive.dp(responsive.isTablet ? 1.8 : 1.9),
                onChanged: (text) {
                  _name = text;
                },
                validator: (text) {
                  if (text.trim().length == 0) {
                    return "Invalid Name";
                  }
                  return null;
                },
              ),
              SizedBox(height: responsive.dp(2)),
              InputText(
                keyboardType: TextInputType.emailAddress,
                label: "AGE",
                fontSize: responsive.dp(responsive.isTablet ? 1.8 : 1.9),
                onChanged: (text) {
                  _age = text;
                },
                validator: (text) {
                  if (text.trim().length == 0) {
                    return "Invalid Age";
                  }
                  return null;
                },
              ),
              SizedBox(height: responsive.dp(2)),
              InputText(
                keyboardType: TextInputType.emailAddress,
                label: "TEAMS",
                fontSize: responsive.dp(responsive.isTablet ? 1.8 : 1.9),
                onChanged: (text) {
                  _teams = text;
                },
                validator: (text) {
                  if (text.trim().length == 0) {
                    return "Invalid Teams";
                  }
                  return null;
                },
              ),
              SizedBox(height: responsive.dp(5)),
              SizedBox(
                width: double.infinity,
                child: FlatButton(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  child: Text(
                    "Update",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: responsive.dp(1.5),
                    ),
                  ),
                  onPressed: _submit,
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

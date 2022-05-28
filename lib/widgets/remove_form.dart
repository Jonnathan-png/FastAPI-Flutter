// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_fastmongo/api/my_api.dart';
import 'package:flutter_fastmongo/utils/responsive.dart';
import 'input_text.dart';

class RemoveForm extends StatefulWidget {
  const RemoveForm({Key? key}) : super(key: key);

  @override
  _RemoveFormState createState() => _RemoveFormState();
}

class _RemoveFormState extends State<RemoveForm> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  String _id = '' ;

  _submit() async {
    final isOk = _formKey.currentState!.validate();
    print("form RemoveisOk $isOk");
    if (isOk) {
       await MyAPI.instance.deleteUser(
        context,
        id: _id,
        token: "",
      ); 
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
                  _id = text;
                },
                validator: (text) {
                  if (text.trim().length < 5) {
                    return "Invalid Id";
                  }
                  return "null";
                },
              ),
              SizedBox(height: responsive.dp(2)),
              SizedBox(
                width: double.infinity,
                child: FlatButton(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  child: Text(
                    "Delete",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: responsive.dp(1.5),
                    ),
                  ),
                  onPressed: _submit,
                  color: Colors.pinkAccent,
                ),
              ),
              SizedBox(height: responsive.dp(2)),
            ],
          ),
        ),
      ),
    );
  }
}

// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_fastmongo/utils/responsive.dart';
import 'package:flutter_fastmongo/widgets/search_form.dart';
import 'input_text.dart';

class FindOneForm extends StatefulWidget {
  const FindOneForm({Key? key}) : super(key: key);

  @override
  _FindOneFormState createState() => _FindOneFormState();
}

class _FindOneFormState extends State<FindOneForm> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  String _id = '';

  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive.of(context);

    return Positioned(
      bottom: 20,
      child: Container(
        constraints: BoxConstraints(
          maxWidth: responsive.isTablet ? 320 : 340,
        ),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              InputText(
                keyboardType: TextInputType.text,
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
                    "Search",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: responsive.dp(1.5),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SearchForm(id: _id)));
                  },
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

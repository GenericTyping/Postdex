import 'dart:async';

import 'package:flutter/material.dart';

import 'package:postdex/models/_constants.dart';
import 'package:postdex/pages/home_page.dart';

enum AuthState { Idle, Authenticating, Success, Failed }

class AuthPage extends StatefulWidget {
  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  static final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  AuthState authState = AuthState.Idle;

  String _username;
  String _password;

  @override
  Widget build(BuildContext context) {
    void submit() async {
      if (_formKey.currentState.validate()) {
        setState(() => authState = AuthState.Authenticating);
        _formKey.currentState.save();

        try {
          await Constants.initializeRedditUser(_username, _password);
          setState(() => authState = AuthState.Success);
          await Future.delayed(Duration(seconds: 2));
          Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => HomePage()));
        } catch (e) {
          // Not catching exceptions correctly.
          setState(() => authState = AuthState.Failed);
        }
      }
    }

    Widget submitButton = FlatButton(
        child: (authState == AuthState.Authenticating)
            ? CircularProgressIndicator()
            : (authState == AuthState.Success)
                ? Icon(Icons.check)
                : Text("Log In"),
        onPressed: submit);

    final Widget formFields = ListView(
      shrinkWrap: true,
      children: <Widget>[
        TextFormField(
          validator: (value) =>
              (value.isEmpty) ? "Username cannot be empty." : null,
          decoration: InputDecoration(labelText: "username"),
          onSaved: (value) => _username = value,
        ),
        TextFormField(
          validator: (value) =>
              (value.isEmpty) ? "Password cannot be empty." : null,
          decoration: InputDecoration(labelText: "password"),
          obscureText: true,
          onSaved: (value) => _password = value,
        )
      ],
    );

    final Widget logInForm = FractionallySizedBox(
        widthFactor: 0.6, child: Form(key: _formKey, child: formFields));

    return Scaffold(
      body: Center(
        child: new Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            logInForm,
            new Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: submitButton,
            )
          ],
        ),
      ),
    );
  }
}

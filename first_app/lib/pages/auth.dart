import 'package:flutter/material.dart';

import './products.dart';

class AuthPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return AuthPageState();
  }
}

class AuthPageState extends State<AuthPage> {
  String _emailValue = "";
  String _passwordValue = "";
  bool _acceptTerms = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
      ),
      body: Container(
      margin: EdgeInsets.all(10.0),
      child: ListView(
        children: <Widget>[
          TextField(
            decoration: InputDecoration(
              labelText: "E-Mail",
            ),
            keyboardType: TextInputType.emailAddress,
            onChanged: (String value) {
              setState(() {
                _emailValue = value;
              });
            },
          ),
          TextField(
            decoration: InputDecoration(
              labelText: "Password",
            ),
            obscureText: true,
            onChanged: (String value) {
              setState(() {
                _passwordValue = value;
              });
            },
          ),
          SizedBox(
            height: 10.0,
          ),
          SwitchListTile(
            value : _acceptTerms,
            onChanged: (bool accept) {
              setState(() {
                _acceptTerms = accept;
              });
            },
            title: Text("Accept Terms"),
          ),
          RaisedButton(
            color: Theme.of(context).accentColor,
            child: Text("LOGIN"),
            textColor: Colors.white,
            onPressed: () {
              print(_emailValue);
              print(_passwordValue);
              Navigator.pushReplacementNamed(context, "/products");
            },
          )
        ],
      ),
    ),
    );
  }
}

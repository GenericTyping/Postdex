import 'package:flutter/material.dart';

import 'package:postdex/pages/home_page.dart';
import 'package:postdex/pages/auth_page.dart';

void main() async => runApp(new PostdexApp());

class PostdexApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Postdex',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: AuthPage(),
    );
  }
}



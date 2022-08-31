import 'package:flutter/material.dart';

class ExampleHomeView extends StatelessWidget {

  final String user;

  const ExampleHomeView({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Hola! ${user}'),
      ),
    );
  }
}

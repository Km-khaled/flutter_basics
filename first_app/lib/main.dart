import 'package:flutter/material.dart';
import 'package:first_app/gradient_container.dart';

void main() {
  runApp(
     const MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.brown,
        body: GradientContainer(color:[Colors.red, Colors.green]),
      ),
    ),
  );
}

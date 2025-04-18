import 'package:flutter/material.dart';

class Super extends StatelessWidget {
  const Super({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Super')),

      body: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Text("Super", style: TextStyle(fontSize: 30)),
      ),
    );
  }
}

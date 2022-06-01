import 'package:flutter/material.dart';

class Intern_HomeScreen extends StatelessWidget {
  const Intern_HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('App Screen'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'First App Screen',
          style: TextStyle(fontSize: 25),
        ),
      ),
    );
  }
}

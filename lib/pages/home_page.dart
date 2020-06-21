import 'package:flutter/material.dart';

const PrimaryColor = const Color.fromRGBO(16, 155, 197, 1);

class HomePage extends StatefulWidget {

  @override
  createState() => _HomePageState();

}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: PrimaryColor,
        title: const Text('Volver'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('HI')
        ]
      )
    );
  }

}
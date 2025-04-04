// ignore_for_file: prefer_const_constructors
// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class CotacaoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(),
        body: Container(
          margin: EdgeInsets.all(20),
          child: Column(
            children: [
              TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "Reais",
                  border: OutlineInputBorder(),
                ),
              ),
              ElevatedButton(
                onPressed: null,
                child: Text("Converter"),
              ),
              Text("Dólares")
            ],
          ),
        ),
      ),
    );
  }
}

// ignore_for_file: prefer_const_constructors
// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class CotacaoApp extends StatelessWidget {

  var txtReais = TextEditingController();
  var txtResultado = TextEditingController();
  String moeda = "USD-BRL";

  void converter() async {
    String url = "https://economia.awesomeapi.com.br/json/last/$moeda";

    var response = await http.get(Uri.parse(url));

    Map<String, dynamic> dados = json.decode(response.body);

    double cotacao = double.parse(dados[moeda.replaceFirst("-", "")]["ask"]);

    var resultado = double.parse(txtReais.text) / cotacao;
    txtResultado.text = resultado.toString();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(),
        body: Container(
          margin: EdgeInsets.all(10),
          child: Column(
            //spacing: 10,
            children: [
              TextField(
                controller: txtReais,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "Reais",
                  border: OutlineInputBorder(),
                ),
              ),
              Container(height: 10,),
              DropdownMenu(
                onSelected: (value) => moeda = value!,
                dropdownMenuEntries: [
                  DropdownMenuEntry(value: "USD-BRL", label: "Dólar"),
                  DropdownMenuEntry(value: "EUR-BRL", label: "Euro"),
                  DropdownMenuEntry(value: "BTC-BRL", label: "Bitcoin")
                ],
              ),
              Container(height: 10,),
              ElevatedButton(
                onPressed: converter,
                child: Text("Converter"),
              ),
              Container(height: 10,),
              TextField(
                controller: txtResultado,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "Resultado",
                  border: OutlineInputBorder(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

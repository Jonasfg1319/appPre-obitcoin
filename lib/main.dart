import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

void main(){
  runApp(
    MaterialApp(
      home: Home(),
      debugShowCheckedModeBanner: false,
    )
  );
}


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String _preco = '0.0';
 _exibir() async{
   String url = "https://blockchain.info/ticker";
   http.Response response = await http.get(url);
   Map<String, dynamic> retorno = json.decode(response.body);
   String valor = retorno["BRL"]["buy"].toString();

   setState(() {
     _preco = valor;
   });
 }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset("imagens/bitcoin.png"),
            Padding(padding: EdgeInsets.only(top: 15, bottom: 15),
            child: Text("R\$ "+_preco, style: TextStyle(fontSize: 40),),
            ),
            RaisedButton(color: Colors.orange ,onPressed: _exibir, child: Text("Atualizar", style: TextStyle(fontSize: 35,color: Colors.white),),)
          ],
        ),
      ),
    );
  }
}

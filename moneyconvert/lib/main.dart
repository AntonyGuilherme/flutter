import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() async {
  runApp(MaterialApp(
    home: Home(),
    theme: ThemeData(hintColor: Colors.green, primaryColor: Colors.white),
  ));


}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final realController = TextEditingController();
  final dolarController = TextEditingController();
  final euroController = TextEditingController();

  double dolar;
  double euro;

  void _clearAll() {
    realController.text = "";
    dolarController.text = "";
    euroController.text = "";
  }

  void _realChanged(String text) {
    if (text.isEmpty) {
      _clearAll();
      return;
    }

    double real = double.parse(text);
    dolarController.text = (real / dolar).toStringAsFixed(2);
    euroController.text = (real / euro).toStringAsFixed(2);
  }

  void _dolarChanged(String text) {
    if (text.isEmpty) {
      _clearAll();
      return;
    }

    double dolar = double.parse(text);
    realController.text = (dolar * this.dolar).toStringAsFixed(2);
    euroController.text = (dolar * this.dolar / euro).toStringAsFixed(2);
  }

  void _euroChanged(String text) {
    if (text.isEmpty) {
      _clearAll();
      return;
    }

    double euro = double.parse(text);
    realController.text = (euro * this.euro).toStringAsFixed(2);
    dolarController.text = (euro * this.euro / dolar).toStringAsFixed(2);
  }

  Widget buildTextField(String label, String prefix , TextEditingController c , Function f){

    return TextField(
      controller: c,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(color: Colors.green),
        border: OutlineInputBorder(),
        prefixText: prefix
      ),
      style: TextStyle(
        color: Colors.green, fontSize: 25.0
      ),
      onChanged: f,
      keyboardType: TextInputType.numberWithOptions(decimal:true),
    );

  }

  @override
  Widget build(BuildContext context) {

    Future<Map> getData() async {
      Uri request = Uri(host: "10.0.2.2", port: 4001, path: "/convert" , scheme: 'http');
      http.Response response = await http.get(request);
      return json.decode(response.body);
    }

    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: Text("Conversor de moeda"),
          backgroundColor: Colors.green,
          centerTitle: true,
        ),
        body: FutureBuilder<Map>(
          future: getData(),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
              case ConnectionState.waiting:
                return Center(
                  child: Text("Aguarde...",
                    style: TextStyle(
                        color: Colors.green,
                        fontSize: 30.0
                    ),
                    textAlign: TextAlign.center,
                  ),
                );
              default :
                if (snapshot.hasError) {
                  print(snapshot.error);
                  return Center(
                      child: Text("Ops, houve uma falha ao buscar os dados",
                            style: TextStyle(
                          color: Colors.green,
                        fontSize: 25.0
                      ),
                    textAlign: TextAlign.center,
                      )
                  );
                }else{
                  print(snapshot.data);
                  dolar = snapshot.data["dolar"];
                  euro = snapshot.data["euro"];

                  return SingleChildScrollView(
                    padding: EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Icon(Icons.attach_money , size: 180.0, color: Colors.green,),
                        buildTextField("Real","R\$ ",realController,_realChanged),
                        Divider(),
                        buildTextField("Euro","E\$ ",euroController,_euroChanged),
                        Divider(),
                        buildTextField("Dolar","D\$ ",dolarController,_dolarChanged),
                      ],
                    ),
                  );
                }
            }
          },
        )
    );
  }
}

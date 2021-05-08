import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Livro sobre Fultter',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  /* No Dart tudo que contém underline antes do nome é privado */

  int _counter = 0;

  void _incrementCounter(){
    setState(() {
      _counter++;
    });
  }

  void alert(String message){
    print(message);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Nosso aplicativo'),
          backgroundColor: Colors.brown,
        ),
        body: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('Vezes que o botão foi apertado'),
                Text('$_counter',style: Theme.of(context).textTheme.display1,)
              ]
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: _incrementCounter,
          child: Icon(Icons.add),
          backgroundColor: Colors.red,
        ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.brown,
        child: Container(
          height: 100,
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Row(
              children: <Widget>[
                IconButton(
                    icon: Icon(Icons.add_box, color: Colors.white),
                    onPressed: () { alert('Adcionei qualquer coisa'); }
                    ),
                IconButton(
                    icon: Icon(Icons.add_a_photo, color : Colors.white),
                    onPressed: () { alert('Adicionei uma foto'); })

              ],
            ),
          ),
        ),
      ),
    );
  }


}

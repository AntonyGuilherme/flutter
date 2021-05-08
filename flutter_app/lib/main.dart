import 'package:flutter/material.dart';

void main() {
  /*runApp(Center(
      child: Text('Hello, world!',
          textDirection: TextDirection.ltr,
          style: TextStyle(fontSize: 30.0))));*/

  runApp(MaterialApp(
    title: 'Flutter Tutorial',
    home: TutorialHome()
  ));

}


class TutorialHome extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.menu),
          tooltip: 'Menu de Navegação',
          onPressed: null
        ),
          title : Text('Title'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            tooltip: 'Buscar',
            onPressed: null,
          )
        ]
      ),
      body: Center(
          child: Text('Olá Mundo!')
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Adicionar',
        child: Icon(Icons.add),
        onPressed: null,
      ),
    );
  }

}


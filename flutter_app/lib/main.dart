import 'package:flutter/material.dart';

void main() {
  runApp(FriendsApp());
}

class FriendsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'My friends',
        home: Scaffold(
            appBar: AppBar(
              title: Text('Meus amigos'),
              backgroundColor: Colors.red,
            ),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                      padding: const EdgeInsets.all(10),
                      child: DecoratedBox(
                        decoration: BoxDecoration(color: Colors.lightBlue),
                        child: Text('Maria', style: TextStyle(fontSize: 50)),
                      )),
                  Padding(
                      padding: const EdgeInsets.all(10),
                      child : DecoratedBox(
                        decoration: BoxDecoration(color: Colors.lightBlue),
                        child: Text('Gabriel', style: TextStyle(fontSize: 50),),
                      )
                  )
                ],
              ),
            )));
  }
}

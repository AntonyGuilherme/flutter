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
                  MyFriend('Antony'),
                  Padding(
                      padding: const EdgeInsets.all(10),
                      child: DecoratedBox(
                        decoration: BoxDecoration(color: Colors.lightBlue),
                        child: Text(
                          'Gabriel',
                          style: TextStyle(fontSize: 50),
                        ),
                      ))
                ],
              ),
            )));
  }
}

//StatelessWidget - no dinamic
class MyFriend extends StatelessWidget {
  final String text;

  const MyFriend(this.text);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: DecoratedBox(
        decoration: BoxDecoration(color: Colors.lightBlueAccent),
        child: Text(text, style: TextStyle(fontSize: 50)),
      ),
    );
  }
}

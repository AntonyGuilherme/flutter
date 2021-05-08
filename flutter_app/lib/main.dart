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
                  ItemCounter('Antony'),
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


class ItemCounter extends StatefulWidget {
  final String name;
  ItemCounter(this.name);

  @override
  _ItemCounterState createState() => _ItemCounterState();
}

class _ItemCounterState extends State<ItemCounter>{
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){ setState(() {
        count++;
      });  },
      child: Text('${widget.name}: $count' , style: TextStyle(fontSize: 50),),
    );
  }
}

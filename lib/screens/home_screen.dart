import 'dart:isolate';

import 'package:flutter/material.dart';
import 'package:isolates/screens/second_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.title});

  final String title;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  int calculate = 0;

  void newIsolate(){
    var receive = ReceivePort();
    Isolate.spawn(sum, receive.sendPort);

    receive.listen((message) {
      print(message[0]);
    });
  }

  static void sum(SendPort sendPort) {
    var receive = ReceivePort();

    var total = 0;
    for(var i = 0; i < 10000000; i++){
      total += i;
    }
    sendPort.send([total, receive.sendPort]);
  }


  void demo() async {
    print('A');
    Future(() {
      print('B');
    });
    print('C');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$calculate',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          demo();
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const SecondScreen()),
          );
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
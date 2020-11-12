import 'package:flutter/material.dart';

class ArView extends StatefulWidget {
  ArView({Key key}) : super(key: key);

  @override
  _ArViewState createState() => _ArViewState();
}

class _ArViewState extends State<ArView> {
  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(
        title: const Text('AR Items'),
        backgroundColor: colorScheme.onSecondary,
      ),
      body: ListView(
        //scrollDirection: Axis.vertical,
        padding: const EdgeInsets.all(8),
        children: <Widget>[
          Container(
            //width: 160.0,
            height: 50,
            color: colorScheme.onSecondary,
            child: const Center(
              child: Text('AR Item 1'),
            ),
          ),
          Container(
            width: 160.0,
            color: Colors.red,
          ),
          Container(
            width: 160.0,
            color: Colors.pink,
          ),
        ],
      ),
    );
  }
}

import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../widgets/crosswordWidget.dart';

class CrosswordScreen extends StatefulWidget {
  final String title;
  CrosswordScreen({required this.title});

  @override
  _CrosswordScreenState createState() => _CrosswordScreenState();
}

class _CrosswordScreenState extends State<CrosswordScreen> {
  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? CupertinoPageScaffold(
            navigationBar: CupertinoNavigationBar(
              middle: Text(widget.title),
            ),
            child: Center(
              child: CrosswordWidget(key: Key('crossword')),
            ),
          )
        : Scaffold(
            appBar: AppBar(
              title: Text(widget.title),
            ),
            body: Center(
              child: CrosswordWidget(key: Key('crossword')),
            ),
          );
  }
}

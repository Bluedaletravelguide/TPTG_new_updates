import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'about_us_screen.dart';
import 'crosswordScreen.dart';
import 'e-book_screen.dart';

class IosMenuScreen extends StatelessWidget {
  Widget build(BuildContext context) {
    return PlatformScaffold(
        appBar: PlatformAppBar(
          title: Text('TAIPING THE GUIDE MENU'),
        ),
        body: Material(
          child: ListView(
            children: [
              ListTile(
                leading: Icon(
                  CupertinoIcons.book,
                  color: Colors.black,
                ),
                title: Text(
                  'E-book',
                  style: TextStyle(color: Colors.black),
                ),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.of(context).push(
                    platformPageRoute(
                        context: context,
                        builder: (context) => new FirstPage()),
                  );
                },
              ),
              ListTile(
                leading: Icon(
                  CupertinoIcons.info,
                  color: Colors.black,
                ),
                title: Text(
                  'About Us',
                  style: TextStyle(color: Colors.black),
                ),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.of(context).push(
                    platformPageRoute(
                        context: context,
                        builder: (context) => new AboutUsScreen()),
                  );
                },
              ),
              ListTile(
                leading: Icon(
                  CupertinoIcons.game_controller,
                  color: Colors.black,
                ),
                title: Text(
                  'Crossword',
                  style: TextStyle(color: Colors.black),
                ),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.of(context).push(
                    platformPageRoute(
                        context: context,
                        builder: (context) => new CrosswordScreen(
                              title: 'Crossword',
                            )),
                  );
                },
              )
            ],
          ),
        ));
  }
}

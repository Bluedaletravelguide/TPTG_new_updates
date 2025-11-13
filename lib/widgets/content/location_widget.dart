import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Location extends StatelessWidget {
  final String text;
  final String location;
  const Location({
    required Key key,
    required this.text,
    required this.location,
  }) : super(key: key);

  void showError(BuildContext context) {
    if (Platform.isIOS) {
      showCupertinoDialog(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text(
                'Error',
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              ),
              content: Text('Location not found!'),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text('OK'))
              ],
            );
          });
    } else {
      showDialog(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text(
                'Error',
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              ),
              content: Text('Location not found!'),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text('OK'))
              ],
            );
          });
    }
  }

  @override
  Widget build(BuildContext context) {
    return text != '-'
        ? InkWell(
            splashColor: Colors.red[600],
            onTap: () async {
              final url = location;
              if (await canLaunch(url)) {
                await launch(url);
              } else {
                showError(context);
              }
            },
            child: Container(
              padding: EdgeInsets.only(bottom: 5),
              child: ListTile(
                leading: Icon(
                  Icons.pin_drop,
                  color: Colors.red,
                  size: MediaQuery.of(context).size.height * 0.04,
                ),
                title: Text(
                  'Location',
                  style: Theme.of(context).textTheme.headlineSmall,
                  textAlign: TextAlign.start,
                ),
                subtitle: Text(
                  text,
                  style: Theme.of(context).textTheme.bodyMedium,
                  textAlign: TextAlign.justify,
                ),
              ),
            ),
          )
        : SizedBox();
  }
}

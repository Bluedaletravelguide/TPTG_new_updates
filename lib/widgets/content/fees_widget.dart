import 'package:flutter/material.dart';

class Fees extends StatelessWidget {
  final String text;
  const Fees({
    required Key key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return text != '-'
        ? Container(
            padding: EdgeInsets.only(bottom: 5),
            child: ListTile(
              leading: Icon(
                Icons.attach_money,
                color: Colors.red,
                size: MediaQuery.of(context).size.height * 0.04,
              ),
              title: Text(
                'Entry Fees',
                style: Theme.of(context).textTheme.displayLarge,
                textAlign: TextAlign.start,
              ),
              subtitle: Text(
                text,
                style: Theme.of(context).textTheme.bodyMedium,
                textAlign: TextAlign.justify,
              ),
            ),
          )
        : SizedBox();
  }
}

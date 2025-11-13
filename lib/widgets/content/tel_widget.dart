import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Tel extends StatelessWidget {
  final String text;
  final String phone;
  const Tel({
    required Key key,
    required this.text,
    required this.phone,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return text != '-'
        ? InkWell(
            splashColor: Colors.red[600],
            onTap: () async {
              String tel = "tel:" + phone;
              if (await canLaunch(tel)) {
                await launch(tel);
              } else {
                throw 'Could not launch $Tel';
              }
            },
            child: Container(
              padding: EdgeInsets.only(bottom: 5),
              child: ListTile(
                leading: Icon(
                  Icons.phone,
                  color: Colors.red,
                  size: MediaQuery.of(context).size.height * 0.04,
                ),
                title: Text(
                  'Phone Number',
                  style: Theme.of(context).textTheme.displayLarge,
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

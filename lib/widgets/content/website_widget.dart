import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Website extends StatelessWidget {
  final String text;
  final String websiteUrl;
  const Website({
    required Key key,
    required this.text,
    required this.websiteUrl,
    required String link,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return text != '-'
        ? InkWell(
            splashColor: Colors.red[600],
            onTap: () async {
              final url = websiteUrl;
              if (await canLaunch(url)) {
                await launch(url);
              } else {
                throw 'Could not launch $url';
              }
            },
            child: Container(
              padding: EdgeInsets.only(bottom: 5),
              child: ListTile(
                leading: Icon(
                  FontAwesomeIcons.globe,
                  color: Colors.red,
                  size: MediaQuery.of(context).size.height * 0.04,
                ),
                title: Text(
                  'Website',
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

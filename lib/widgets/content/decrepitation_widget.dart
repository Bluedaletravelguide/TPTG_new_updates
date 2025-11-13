import 'package:flutter/material.dart';

class Decrepitation extends StatelessWidget {
  final String text;
  const Decrepitation({
    required Key key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return text != '-'
        ? Container(
            height: MediaQuery.of(context).size.width * 0.4,
            width: MediaQuery.of(context).size.width * 0.8,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(400),
              ),
              color: Colors.black38,
            ),
            child: Container(
              padding: const EdgeInsets.only(
                right: 70,
                left: 10,
                top: 20,
              ),
              alignment: Alignment.centerLeft,
              child: Text(
                text,
                style: MediaQuery.of(context).size.width > 500
                    ? Theme.of(context).textTheme.displayMedium
                    : Theme.of(context).textTheme.displaySmall,
                textAlign: TextAlign.left,
                softWrap: true,
                overflow: TextOverflow.fade,
              ),
            ),
          )
        : Container();
  }
}

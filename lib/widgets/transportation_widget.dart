import 'dart:ui';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../Data/SizeConfig.dart';
import 'package:url_launcher/url_launcher.dart';

class Transportation extends StatelessWidget {
  final String id;
  final String title;
  final String description;
  final String tel;
  final String image;

  const Transportation(
      this.id, this.title, this.description, this.tel, this.image);
  Object textSpan(BuildContext context, String text) {
    return TextSpan(text: text);
  }

  Object textSpanNo(BuildContext context, String phoneno) {
    return TextSpan(
      text: phoneno,
      style: TextStyle(color: Colors.blue),
      recognizer: TapGestureRecognizer()
        ..onTap = () async {
          String phone = "tel:" + phoneno;
          if (await canLaunch(phone)) {
            await launch(phone);
          } else {
            throw 'Could not launch $phone';
          }
        },
    );
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 5,
        child: Row(children: [
          Image.asset(
            image,
            height: SizeConfig.blockSizeVertical * 15,
            width: SizeConfig.blockSizeHorizontal * 25,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
              child: Column(children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: Text(
                    title,
                    textAlign: TextAlign.center,
                    softWrap: true,
                    overflow: TextOverflow.fade,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: SizeConfig.safeBlockHorizontal * 4),
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  padding: EdgeInsets.only(right: 5),
                  width: MediaQuery.of(context).size.width,
                  child: Text(
                    description,
                    textAlign: TextAlign.justify,
                    softWrap: true,
                    overflow: TextOverflow.fade,
                    style: TextStyle(
                        color: Colors.black54,
                        fontSize: SizeConfig.safeBlockHorizontal * 3.5),
                  ),
                ),
                SizedBox(height: 5),
                tel != '-'
                    ? Container(
                        width: MediaQuery.of(context).size.width,
                        child: RichText(
                          textAlign: TextAlign.justify,
                          softWrap: true,
                          overflow: TextOverflow.fade,
                          text: TextSpan(
                              style: TextStyle(
                                  fontSize: SizeConfig.safeBlockHorizontal * 3,
                                  color: Colors.black),
                              children: <TextSpan>[
                                //textSpan(context, 'Helpline: '),
                                //textSpanNo(context, tel)
                              ]),
                        ),
                      )
                    : Container()
              ]),
            ),
          )
        ]),
      ),
    );
  }
}

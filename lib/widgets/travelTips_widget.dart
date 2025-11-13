import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../Data/SizeConfig.dart';
import 'package:url_launcher/url_launcher.dart';

class TravelTips extends StatefulWidget {
  final String id;
  final String title;
  final String description;
  final String image;

  const TravelTips(this.id, this.title, this.description, this.image);

  @override
  _TravelTipsState createState() => _TravelTipsState();
}

class _TravelTipsState extends State<TravelTips> {
  TextSpan textSpan(BuildContext context, String text) {
    return TextSpan(text: text);
  }

  TextSpan textSpanNo(BuildContext context, String phoneno) {
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

  String urlWeather = 'https://www.ventusky.com/';
  String urlTimeZone = 'https://www.timeanddate.com/time/map/';
  String urlCurrency = 'https://www.xe.com/';
  String urlPassports =
      'https://www.imi.gov.my/portal2017/index.php/en/entry-requirements-into-malaysia.html';
  String urlPrepaidSim = "https://www.phonetech.my/telco";
  String urlDialingPrefix = "https://dialcode.org/Asia/Malaysia/";
  String urlEmergencyNumber =
      "https://wospace.com.my/wp-content/uploads/2019/07/51.jpg";

  Future<void> _launchInBrowser(String url) async {
    if (await canLaunch(url)) {
      await launch(
        url,
        forceSafariVC: false,
        forceWebView: false,
        headers: <String, String>{'header_key': 'header_value'},
      );
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final sizeConfigVirtical = SizeConfig.blockSizeVertical;
    final sizeConfigHorizontal = SizeConfig.blockSizeHorizontal;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          if (widget.id == "tt1") {
            _launchInBrowser(urlWeather);
          } else if (widget.id == 'tt2') {
            _launchInBrowser(urlTimeZone);
          } else if (widget.id == 'tt3') {
            _launchInBrowser(urlCurrency);
          } else if (widget.id == 'tt4') {
          } else if (widget.id == 'tt5') {
            _launchInBrowser(urlPassports);
          } else if (widget.id == 'tt13') {
            _launchInBrowser(urlPrepaidSim);
          } else if (widget.id == 'tt14') {
            _launchInBrowser(urlDialingPrefix);
          } else if (widget.id == 'tt15') {
            _launchInBrowser(urlEmergencyNumber);
          }
        },
        child: Card(
          elevation: 5,
          child: Row(children: [
            Image.asset(
              widget.image,
              height: sizeConfigVirtical * 15,
              width: sizeConfigHorizontal * 25,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Column(children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    child: Text(
                      widget.title,
                      textAlign: TextAlign.center,
                      softWrap: true,
                      overflow: TextOverflow.fade,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: sizeConfigHorizontal * 4),
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    padding: EdgeInsets.only(bottom: 20, right: 5),
                    width: MediaQuery.of(context).size.width,
                    child: widget.id != 'tt15'
                        ? Text(
                            widget.description,
                            textAlign: TextAlign.justify,
                            softWrap: true,
                            overflow: TextOverflow.fade,
                            style: TextStyle(
                                color: Colors.black54,
                                fontSize: SizeConfig.safeBlockHorizontal * 3.5),
                          )
                        : RichText(
                            textAlign: TextAlign.justify,
                            softWrap: true,
                            overflow: TextOverflow.fade,
                            text: TextSpan(
                                style: TextStyle(
                                    color: Colors.black54,
                                    fontSize:
                                        SizeConfig.safeBlockHorizontal * 3.5),
                                children: <TextSpan>[
                                  textSpan(context, 'Police/Ambulance:\n999 ('),
                                  textSpanNo(context, '112'),
                                  textSpan(context, ' from a mobile phone)\n'),
                                  //-------------------//
                                  textSpan(context,
                                      'Fire and Rescue Department (Bomba): \n994 ('),
                                  textSpanNo(context, '112'),
                                  textSpan(context, ' from a mobile phone)'),
                                  //-------------------//
                                  textSpan(context, '\nPolice Hotline:  \n'),
                                  textSpanNo(context, '088-318555'),
                                  //-------------------//
                                  textSpan(context,
                                      '\n\nClick Here To Know More Info'),
                                ]),
                          ),
                  ),
                ]),
              ),
            )
          ]),
        ),
      ),
    );
  }
}

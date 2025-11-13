import 'dart:io';

//import 'package:google_mobile_ads/google_mobile_ads.dart';

import '../models/Adsban.dart';
import '../widgets/content/website_widget.dart';
import 'package:flutter/material.dart';
import '../Data/content_data.dart';
import 'package:flutter/cupertino.dart';
import '../widgets/content/decrepitation_widget.dart';
import '../widgets/content/fees_widget.dart';
import '../widgets/content/tel_widget.dart';
import '../widgets/content/workHour_widget.dart';
import '../widgets/content/location_widget.dart';

class ContentScreen extends StatefulWidget {
  static const routeName = '/content_screen';
  final String appbartitle;
  final String id;
  final String image;

  const ContentScreen({
    required Key key,
    required this.appbartitle,
    required this.id,
    required this.image,
  }) : super(key: key);

  @override
  _ContentScreenState createState() => _ContentScreenState();
}

class _ContentScreenState extends State<ContentScreen> {
  // Ads Code:
  //late BannerAd _bannerAd;

  void initState() {
    super.initState();
    //_bannerAd = BanAdsense().createBannerAd()..load();
  }

  @override
  void dispose() {
    //_bannerAd.dispose();
    super.dispose();
  }

  void removeAd() {
    //_bannerAd.dispose();
  }

  PreferredSizeWidget createAppBar(String title) {
    if (Platform.isIOS) {
      return CupertinoNavigationBar(
        middle: Text(title),
      );
    } else {
      return AppBar(
        title: Text(title),
      );
    }
  }

  double getSmartBannerHeight(BuildContext context) {
    MediaQueryData mediaScreen = MediaQuery.of(context);
    double dpHeight = mediaScreen.orientation == Orientation.portrait
        ? mediaScreen.size.height
        : mediaScreen.size.width;
    if (dpHeight <= 400.0) {
      return 32.0;
    }
    if (dpHeight > 720.0) {
      return 90.0;
    }
    return 50.0;
  }

  @override
  void didUpdateWidget(covariant ContentScreen oldWidget) {
    removeAd();
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    final contentTitle = widget.appbartitle;
    final contentId = widget.id;
    final contentImage = widget.image;

    // Ensure ContentData is not null and has data
    if (ContentData.isEmpty) {
      return Scaffold(
        appBar: createAppBar(contentTitle),
        body: Center(
          child: Text('No content available.'),
        ),
      );
    }

    final selectContent =
        ContentData.firstWhere((contents) => contents.id == contentId);

    final pageBody = SafeArea(
      child: Material(
        child: Padding(
          padding: EdgeInsets.only(bottom: 0),
          child: SingleChildScrollView(
            child: Column(children: [
              Stack(children: [
                Image.asset(
                  contentImage,
                  width: double.infinity,
                  fit: BoxFit.fill,
                ),
                Positioned(
                  bottom: 0,
                  child: Decrepitation(
                    key: UniqueKey(), // Add the required key parameter
                    text: selectContent.decrepitation,
                  ),
                ),
              ]),
              Container(
                margin: EdgeInsets.only(top: 30),
                padding: EdgeInsets.symmetric(horizontal: 20),
                alignment: Alignment.center,
                child: Text(
                  selectContent.content,
                  style: Theme.of(context).textTheme.bodyMedium,
                  textAlign: TextAlign.justify,
                ),
              ),
              SizedBox(height: 10),
              Fees(
                key: UniqueKey(), // Add the required key parameter
                text: selectContent.fees,
              ),
              Tel(
                key: UniqueKey(), // Add the required key parameter
                text: selectContent.phoneNo,
                phone: selectContent.phoneNo,
              ),
              WorkHour(
                key: UniqueKey(), // Add the required key parameter
                text: selectContent.workhour,
              ),
              Location(
                key: UniqueKey(), // Add the required key parameter
                text: selectContent.locationText,
                location: selectContent.locationUrl,
              ),
              Website(
                key: UniqueKey(), // Add the required key parameter
                text: selectContent.web,
                link: selectContent.webUrl, websiteUrl: '',
              ),
              SizedBox(height: 50),
            ]),
          ),
        ),
      ),
    );


    return Scaffold(
      appBar: createAppBar(contentTitle),
      body: pageBody,
      //bottomNavigationBar: adPlace,
    );
  }
}

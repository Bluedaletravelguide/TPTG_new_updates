import '../models/Adsban.dart';
//import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:flutter/material.dart';
import '../Data/travel_tips_data.dart';
import '../widgets/travelTips_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

class TravelTipsScreen extends StatefulWidget {
  static const routeName = '/travel_tips_screen';
  final String appbartitle;

  const TravelTipsScreen({required Key key, required this.appbartitle})
      : super(key: key);

  @override
  _TravelTipsScreenState createState() => _TravelTipsScreenState();
}

class _TravelTipsScreenState extends State<TravelTipsScreen> {
  //late BannerAd _bannerAd;
  //late BanAdsense _banAdsense;

  void initState() {
    super.initState();
    //_bannerAd = BanAdsense().createBannerAd()..load();
  }

  @override
  void dispose() {
    //_bannerAd.dispose();
    //_banAdsense.removeAd();
    super.dispose();
  }

  void removeAd() {
    //_bannerAd.dispose();
    //_bannerAd = null;
  }

  @override
  void didUpdateWidget(covariant TravelTipsScreen oldWidget) {
    removeAd();
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    final subCategoryTitle = widget.appbartitle;
    final pageBody = SafeArea(
      child: Material(
        child: Padding(
          padding: EdgeInsets.zero,
          child: SingleChildScrollView(
            child: Column(
              children: TravelTipsData.map(
                (con) => TravelTips(
                  con.id,
                  con.title,
                  con.description,
                  con.image,
                ),
              ).toList(),
            ),
          ),
        ),
      ),
    );
    return PlatformScaffold(
      appBar: PlatformAppBar(
        title: Text(subCategoryTitle),
      ),
      body: pageBody,
    );
  }
}

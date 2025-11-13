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
  // Nature-inspired color palette
  static const Color primaryGreen = Color(0xFF2D5016);
  static const Color lightGreen = Color(0xFF4A7C29);
  static const Color accentGreen = Color(0xFF6B9D3A);
  static const Color softGreen = Color(0xFF8FBC5A);
  static const Color paleGreen = Color(0xFFE8F5E1);
  static const Color creamWhite = Color(0xFFFAFDF8);

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

    final pageBody = Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [creamWhite, paleGreen, creamWhite],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: [0.0, 0.5, 1.0],
        ),
      ),
      child: SafeArea(
        child: Column(
          children: [
            // Decorative header
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 16),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [lightGreen.withOpacity(0.1), accentGreen.withOpacity(0.05)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
                boxShadow: [
                  BoxShadow(
                    color: lightGreen.withOpacity(0.1),
                    blurRadius: 10,
                    offset: Offset(0, 5),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.lightbulb_outline,
                    color: accentGreen,
                    size: 28,
                  ),
                  SizedBox(width: 12),
                  Text(
                    'Discover Helpful Tips',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: primaryGreen,
                      letterSpacing: 0.5,
                    ),
                  ),
                ],
              ),
            ),

            // Tips list
            Expanded(
              child: Material(
                color: Colors.transparent,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  child: SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    child: Column(
                      children: [
                        SizedBox(height: 8),
                        ...TravelTipsData.toList().asMap().entries.map(
                              (entry) {
                            int index = entry.key;
                            var con = entry.value;
                            return Padding(
                              padding: EdgeInsets.only(bottom: 16),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(
                                    color: index % 2 == 0
                                        ? softGreen.withOpacity(0.4)
                                        : accentGreen.withOpacity(0.3),
                                    width: 2,
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: lightGreen.withOpacity(0.12),
                                      blurRadius: 12,
                                      offset: Offset(0, 4),
                                    ),
                                  ],
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(18),
                                  child: TravelTips(
                                    con.id,
                                    con.title,
                                    con.description,
                                    con.image,
                                  ),
                                ),
                              ),
                            );
                          },
                        ).toList(),
                        SizedBox(height: 16),

                        // Bottom decorative element
                        Container(
                          padding: EdgeInsets.symmetric(vertical: 16, horizontal: 24),
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                paleGreen.withOpacity(0.6),
                                softGreen.withOpacity(0.3),
                              ],
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                            ),
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                              color: softGreen.withOpacity(0.3),
                              width: 1,
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.explore,
                                color: primaryGreen,
                                size: 20,
                              ),
                              SizedBox(width: 8),
                              Text(
                                'Happy Exploring Taiping!',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: primaryGreen,
                                  letterSpacing: 0.3,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 8),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );

    return PlatformScaffold(
      appBar: PlatformAppBar(
        title: Text(
          subCategoryTitle,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        material: (_, __) => MaterialAppBarData(
          backgroundColor: primaryGreen,
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.white),
        ),
        cupertino: (_, __) => CupertinoNavigationBarData(
          backgroundColor: primaryGreen,
        ),
      ),
      body: pageBody,
    );
  }
}
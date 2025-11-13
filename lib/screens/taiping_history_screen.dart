import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart';
import '../Data/taiping_history_data.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
//import 'package:google_mobile_ads/google_mobile_ads.dart';
//import '../models/Adsban.dart';

class TaipingHistoryScreen extends StatefulWidget {
  static const routeName = '/taiping_history_screen';

  // Nature-inspired color palette
  static const Color primaryGreen = Color(0xFF2D5016);
  static const Color lightGreen = Color(0xFF4A7C29);
  static const Color accentGreen = Color(0xFF6B9D3A);
  static const Color softGreen = Color(0xFF8FBC5A);
  static const Color paleGreen = Color(0xFFE8F5E1);
  static const Color creamWhite = Color(0xFFFAFDF8);

  final String id;
  final String yearright;
  final String yearleft;
  final String descriptionright;
  final String descriptionleft;
  final Color colorR1;
  final Color colorR2;
  final Color colorL1;
  final Color colorL2;

  const TaipingHistoryScreen(
      {required this.yearleft,
        required this.yearright,
        required this.descriptionright,
        required this.descriptionleft,
        required this.colorR1,
        required this.colorR2,
        required this.colorL1,
        required this.colorL2,
        required this.id});

  @override
  _TaipingHistoryScreenState createState() => _TaipingHistoryScreenState();
}

class _TaipingHistoryScreenState extends State<TaipingHistoryScreen> {
  // Nature-inspired color palette
  static const Color primaryGreen = Color(0xFF2D5016);
  static const Color lightGreen = Color(0xFF4A7C29);
  static const Color accentGreen = Color(0xFF6B9D3A);
  static const Color softGreen = Color(0xFF8FBC5A);
  static const Color paleGreen = Color(0xFFE8F5E1);
  static const Color creamWhite = Color(0xFFFAFDF8);

  //late BannerAd _bannerAd;
  //late BanAdsense _banAdsense;

  @override
  void initState() {
    super.initState();
    //_bannerAd = BanAdsense().createBannerAd()..load();
  }

  @override
  void dispose() {
    //_bannerAd.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant TaipingHistoryScreen oldWidget) {
    removeAd();
    super.didUpdateWidget(oldWidget);
  }

  void removeAd() {
    //_bannerAd.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final routeArgs =
    ModalRoute.of(context)?.settings.arguments as Map<String, String>;
    final subCategoryTitle = routeArgs['title'];

    return PlatformScaffold(
      appBar: PlatformAppBar(
        title: Text(
          subCategoryTitle!,
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
      body: Container(
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
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                margin: EdgeInsets.only(bottom: 12),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [lightGreen.withOpacity(0.15), accentGreen.withOpacity(0.08)],
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
                      Icons.history_edu,
                      color: accentGreen,
                      size: 28,
                    ),
                    SizedBox(width: 12),
                    Text(
                      'Journey Through Time',
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

              // Timeline content
              Expanded(
                child: Material(
                  color: Colors.transparent,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    child: ListView.builder(
                      physics: BouncingScrollPhysics(),
                      itemCount: TaipingHistoryData.length,
                      itemBuilder: (context, index) {
                        final con = TaipingHistoryData.toList()[index];
                        return Container(
                          child: LayoutBuilder(
                            builder: (context, constraints) {
                              return Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  // Left timeline item
                                  TimelineTile(
                                    alignment: TimelineAlign.center,
                                    isFirst: index == 0,
                                    lineXY: 0.5,
                                    beforeLineStyle: LineStyle(
                                      color: accentGreen,
                                      thickness: 3,
                                    ),
                                    indicatorStyle: IndicatorStyle(
                                      indicatorXY: 0.5,
                                      height: 60,
                                      width: 60,
                                      padding: const EdgeInsets.all(8),
                                      indicator: Container(
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                          gradient: LinearGradient(
                                            colors: [primaryGreen, lightGreen],
                                            begin: Alignment.topLeft,
                                            end: Alignment.bottomRight,
                                          ),
                                          shape: BoxShape.circle,
                                          boxShadow: [
                                            BoxShadow(
                                              color: lightGreen.withOpacity(0.4),
                                              blurRadius: 8,
                                              offset: Offset(0, 3),
                                            ),
                                          ],
                                        ),
                                        child: Text(
                                          con.yearleft,
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14,
                                          ),
                                        ),
                                      ),
                                    ),
                                    startChild: Padding(
                                      padding: EdgeInsets.all(12),
                                      child: Container(
                                        constraints: BoxConstraints(
                                          minHeight: 100,
                                        ),
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.circular(16),
                                          border: Border.all(
                                            color: softGreen.withOpacity(0.4),
                                            width: 2,
                                          ),
                                          boxShadow: [
                                            BoxShadow(
                                              color: lightGreen.withOpacity(0.15),
                                              spreadRadius: 2,
                                              blurRadius: 10,
                                              offset: Offset(-2, 3),
                                            ),
                                          ],
                                        ),
                                        child: Center(
                                          child: Padding(
                                            padding: EdgeInsets.all(16),
                                            child: SingleChildScrollView(
                                              child: Text(
                                                con.descriptionleft,
                                                textAlign: TextAlign.center,
                                                softWrap: true,
                                                overflow: TextOverflow.fade,
                                                style: TextStyle(
                                                  fontSize: MediaQuery.of(context).size.width > 500 ? 16 : 14,
                                                  color: primaryGreen,
                                                  height: 1.5,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),

                                  // Right timeline item
                                  con.id != 'kl10'
                                      ? TimelineTile(
                                    alignment: TimelineAlign.center,
                                    isLast: index == TaipingHistoryData.length - 1,
                                    lineXY: 0.5,
                                    beforeLineStyle: LineStyle(
                                      color: accentGreen,
                                      thickness: 3,
                                    ),
                                    indicatorStyle: IndicatorStyle(
                                      indicatorXY: 0.5,
                                      height: 60,
                                      width: 60,
                                      padding: const EdgeInsets.all(8),
                                      indicator: Container(
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                          gradient: LinearGradient(
                                            colors: [accentGreen, softGreen],
                                            begin: Alignment.topLeft,
                                            end: Alignment.bottomRight,
                                          ),
                                          shape: BoxShape.circle,
                                          boxShadow: [
                                            BoxShadow(
                                              color: accentGreen.withOpacity(0.4),
                                              blurRadius: 8,
                                              offset: Offset(0, 3),
                                            ),
                                          ],
                                        ),
                                        child: Text(
                                          con.yearright,
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14,
                                          ),
                                        ),
                                      ),
                                    ),
                                    endChild: Padding(
                                      padding: EdgeInsets.all(12),
                                      child: Container(
                                        constraints: BoxConstraints(
                                          minHeight: 100,
                                        ),
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.circular(16),
                                          border: Border.all(
                                            color: softGreen.withOpacity(0.4),
                                            width: 2,
                                          ),
                                          boxShadow: [
                                            BoxShadow(
                                              color: lightGreen.withOpacity(0.15),
                                              spreadRadius: 2,
                                              blurRadius: 10,
                                              offset: Offset(2, 3),
                                            ),
                                          ],
                                        ),
                                        child: Center(
                                          child: Padding(
                                            padding: EdgeInsets.all(16),
                                            child: Text(
                                              con.descriptionright,
                                              textAlign: TextAlign.center,
                                              softWrap: true,
                                              overflow: TextOverflow.fade,
                                              style: TextStyle(
                                                fontSize: MediaQuery.of(context).size.width > 500 ? 16 : 14,
                                                color: primaryGreen,
                                                height: 1.5,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                                      : InkWell(
                                    splashColor: softGreen,
                                    onTap: () => launch(
                                        'http://www.taipingtheguide.com.my/Taiping%20History.html'),
                                    child: TimelineTile(
                                      alignment: TimelineAlign.center,
                                      isLast: true,
                                      lineXY: 0.5,
                                      beforeLineStyle: LineStyle(
                                        color: accentGreen,
                                        thickness: 3,
                                      ),
                                      indicatorStyle: IndicatorStyle(
                                        indicatorXY: 0.5,
                                        height: 60,
                                        width: 60,
                                        padding: const EdgeInsets.all(8),
                                        indicator: Container(
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                            gradient: LinearGradient(
                                              colors: [accentGreen, softGreen],
                                              begin: Alignment.topLeft,
                                              end: Alignment.bottomRight,
                                            ),
                                            shape: BoxShape.circle,
                                            boxShadow: [
                                              BoxShadow(
                                                color: accentGreen.withOpacity(0.4),
                                                blurRadius: 8,
                                                offset: Offset(0, 3),
                                              ),
                                            ],
                                          ),
                                          child: Icon(
                                            Icons.open_in_new,
                                            color: Colors.white,
                                            size: 24,
                                          ),
                                        ),
                                      ),
                                      endChild: Padding(
                                        padding: EdgeInsets.all(12),
                                        child: Container(
                                          constraints: BoxConstraints(
                                            minHeight: 100,
                                          ),
                                          decoration: BoxDecoration(
                                            gradient: LinearGradient(
                                              colors: [
                                                paleGreen.withOpacity(0.8),
                                                softGreen.withOpacity(0.3),
                                              ],
                                              begin: Alignment.topLeft,
                                              end: Alignment.bottomRight,
                                            ),
                                            borderRadius: BorderRadius.circular(16),
                                            border: Border.all(
                                              color: accentGreen.withOpacity(0.5),
                                              width: 2,
                                            ),
                                            boxShadow: [
                                              BoxShadow(
                                                color: lightGreen.withOpacity(0.2),
                                                spreadRadius: 2,
                                                blurRadius: 10,
                                                offset: Offset(2, 3),
                                              ),
                                            ],
                                          ),
                                          child: Center(
                                            child: Padding(
                                              padding: EdgeInsets.all(16),
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                  Icon(
                                                    Icons.touch_app,
                                                    color: primaryGreen,
                                                    size: 32,
                                                  ),
                                                  SizedBox(height: 12),
                                                  Text(
                                                    con.descriptionright,
                                                    textAlign: TextAlign.center,
                                                    softWrap: true,
                                                    overflow: TextOverflow.fade,
                                                    style: TextStyle(
                                                      fontSize: MediaQuery.of(context).size.width > 500 ? 16 : 14,
                                                      color: primaryGreen,
                                                      height: 1.5,
                                                      fontWeight: FontWeight.bold,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            },
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
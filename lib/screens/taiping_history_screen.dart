import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart';
import '../Data/taiping_history_data.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
//import 'package:google_mobile_ads/google_mobile_ads.dart';
//import '../models/Adsban.dart';

class TaipingHistoryScreen extends StatefulWidget {
  static const routeName = '/taiping_history_screen';

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
        title: Text(subCategoryTitle!),
      ),
      backgroundColor: Colors.brown[50],
      body: SafeArea(
        child: Material(
          child: Padding(
            padding: EdgeInsets.zero,
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.brown[100]!, Colors.yellow[50]!],
                  begin: Alignment.bottomRight,
                  end: Alignment.topLeft,
                ),
              ),
              child: Padding(
                padding: EdgeInsets.all(8),
                child: GridView.count(
                  crossAxisSpacing: 0,
                  mainAxisSpacing: 0,
                  crossAxisCount: 1,
                  children: TaipingHistoryData.map(
                    (con) => Container(
                      child: LayoutBuilder(
                        builder: (context, constraints) {
                          return Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: TimelineTile(
                                    alignment: TimelineAlign.center,
                                    indicatorStyle: IndicatorStyle(
                                      indicatorXY: 0.5,
                                      height: constraints.maxHeight * 0.13,
                                      width: constraints.maxWidth * 0.13,
                                      padding: const EdgeInsets.all(8),
                                      indicator: Container(
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                          color: Color(0xff423E37),
                                          shape: BoxShape.circle,
                                        ),
                                        child: Text(
                                          con.yearleft,
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ),
                                    ),
                                    startChild: Container(
                                      constraints: BoxConstraints(
                                        minHeight: constraints.minHeight * 0.5,
                                      ),
                                      decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                          colors: <Color>[
                                            con.colorL1,
                                            con.colorL2,
                                          ],
                                          begin: Alignment.bottomRight,
                                          end: Alignment.topLeft,
                                        ),
                                        borderRadius: BorderRadius.circular(10),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.withOpacity(0.5),
                                            spreadRadius: 3,
                                            blurRadius: 7,
                                            offset: Offset(0, 3),
                                          ),
                                        ],
                                      ),
                                      child: Center(
                                        child: Padding(
                                          padding: EdgeInsets.all(5),
                                          child: SingleChildScrollView(
                                            child: Text(
                                              con.descriptionleft,
                                              textAlign: TextAlign.center,
                                              softWrap: true,
                                              overflow: TextOverflow.fade,
                                              style: MediaQuery.of(context)
                                                          .size
                                                          .width >
                                                      500
                                                  ? Theme.of(context)
                                                      .textTheme
                                                      .displayMedium
                                                  : Theme.of(context)
                                                      .textTheme
                                                      .displaySmall,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                con.id != 'kl10'
                                    ? Expanded(
                                        child: TimelineTile(
                                          alignment: TimelineAlign.center,
                                          indicatorStyle: IndicatorStyle(
                                            indicatorXY: 0.5,
                                            height:
                                                constraints.maxHeight * 0.13,
                                            width: constraints.maxWidth * 0.13,
                                            padding: const EdgeInsets.all(8),
                                            indicator: Container(
                                              alignment: Alignment.center,
                                              decoration: BoxDecoration(
                                                color: Color(0xffE3B23C),
                                                shape: BoxShape.circle,
                                              ),
                                              child: Text(
                                                con.yearright,
                                              ),
                                            ),
                                          ),
                                          endChild: Container(
                                            constraints: BoxConstraints(
                                              minHeight:
                                                  constraints.minHeight * 0.5,
                                            ),
                                            decoration: BoxDecoration(
                                              gradient: LinearGradient(
                                                colors: <Color>[
                                                  con.colorR1,
                                                  con.colorR2,
                                                ],
                                                begin: Alignment.bottomRight,
                                                end: Alignment.topLeft,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Colors.grey
                                                      .withOpacity(0.5),
                                                  spreadRadius: 3,
                                                  blurRadius: 7,
                                                  offset: Offset(0, 3),
                                                ),
                                              ],
                                            ),
                                            child: Center(
                                              child: Padding(
                                                padding: EdgeInsets.all(5),
                                                child: Text(
                                                  con.descriptionright,
                                                  textAlign: TextAlign.center,
                                                  softWrap: true,
                                                  overflow: TextOverflow.fade,
                                                  style: MediaQuery.of(context)
                                                              .size
                                                              .width >
                                                          500
                                                      ? Theme.of(context)
                                                          .textTheme
                                                          .displayMedium
                                                      : Theme.of(context)
                                                          .textTheme
                                                          .displaySmall,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      )
                                    : Expanded(
                                        child: InkWell(
                                          splashColor: Colors.brown,
                                          onTap: () => launch(
                                              'http://www.taipingtheguide.com.my/Taiping%20History.html'),
                                          child: TimelineTile(
                                            alignment: TimelineAlign.center,
                                            indicatorStyle: IndicatorStyle(
                                              indicatorXY: 0.5,
                                              height:
                                                  constraints.maxHeight * 0.13,
                                              width:
                                                  constraints.maxWidth * 0.13,
                                              padding: const EdgeInsets.all(8),
                                              indicator: Container(
                                                alignment: Alignment.center,
                                                decoration: BoxDecoration(
                                                  color: Color(0xffE3B23C),
                                                  shape: BoxShape.circle,
                                                ),
                                                child: Text(
                                                  con.yearright,
                                                ),
                                              ),
                                            ),
                                            endChild: Container(
                                              constraints: BoxConstraints(
                                                minHeight:
                                                    constraints.minHeight * 0.5,
                                              ),
                                              decoration: BoxDecoration(
                                                gradient: LinearGradient(
                                                  colors: <Color>[
                                                    con.colorR1,
                                                    con.colorR2,
                                                  ],
                                                  begin: Alignment.bottomRight,
                                                  end: Alignment.topLeft,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: Colors.grey
                                                        .withOpacity(0.5),
                                                    spreadRadius: 3,
                                                    blurRadius: 7,
                                                    offset: Offset(0, 3),
                                                  ),
                                                ],
                                              ),
                                              child: Center(
                                                child: Padding(
                                                  padding: EdgeInsets.all(5),
                                                  child: Text(
                                                    con.descriptionright,
                                                    textAlign: TextAlign.center,
                                                    softWrap: true,
                                                    overflow: TextOverflow.fade,
                                                    style:
                                                        MediaQuery.of(context)
                                                                    .size
                                                                    .width >
                                                                500
                                                            ? Theme.of(context)
                                                                .textTheme
                                                                .displayMedium
                                                            : Theme.of(context)
                                                                .textTheme
                                                                .displaySmall,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                              ]);
                        },
                      ),
                    ),
                  ).toList(),
                ),
              ),
            ),
          ),
        ),
      ),
      // material: (_, __) => MaterialScaffoldData(
      //   // bottomNavigationBar: Container(
      //   //   child: AdWidget(ad: _bannerAd),
      //   //   width: _bannerAd.size.width.toDouble(),
      //   //   height: _bannerAd.size.height.toDouble(),
      //   //   alignment: Alignment.center,
      //   // ),
      // ),
    );
  }
}

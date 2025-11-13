import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart';
import '../Data/tp_at_glance_data.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

class TpAtGlanceScreen extends StatefulWidget {
  static const routeName = '/tp_at_glance_screen';
  final String appbartitle;
  final String id;

  const TpAtGlanceScreen({
    required this.appbartitle,
    required this.id, required String yearleft, required String yearright, required String descriptionleft, required String descriptionright, required Color colorR1, required Color colorR2, required Color colorL1, required Color colorL2,
  });

  @override
  _TpAtGlanceScreenState createState() => _TpAtGlanceScreenState();
}

class _TpAtGlanceScreenState extends State<TpAtGlanceScreen> {
  @override
  Widget build(BuildContext context) {
    final subCategoryTitle = widget.appbartitle;
    final pageBody = SafeArea(
      child: Material(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.brown[100]!,
                Colors.yellow[50]!,
              ],
              begin: Alignment.bottomRight,
              end: Alignment.topLeft,
            ),
          ),
          child: GestureDetector(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.count(
                crossAxisCount: 1,
                children: TpAtGlanceData.map(
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
                                      colors: [
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
                                      padding: const EdgeInsets.all(5.0),
                                      child: Text(
                                        con.descriptionleft,
                                        textAlign: TextAlign.center,
                                        softWrap: true,
                                        overflow: TextOverflow.fade,
                                        style: MediaQuery.of(context).size.width > 500
                                            ? Theme.of(context).textTheme.displaySmall
                                            : Theme.of(context).textTheme.bodyLarge,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
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
                                    minHeight: constraints.minHeight * 0.5,
                                  ),
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      colors: [
                                        con.colorR1,
                                        con.colorR2,
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
                                      padding: const EdgeInsets.all(5.0),
                                      child: Text(
                                        con.descriptionright,
                                        textAlign: TextAlign.center,
                                        softWrap: true,
                                        overflow: TextOverflow.fade,
                                        style: MediaQuery.of(context).size.width > 500
                                            ? Theme.of(context).textTheme.displaySmall
                                            : Theme.of(context).textTheme.bodyLarge,
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
                  ),
                ).toList(),
              ),
            ),
          ),
        ),
      ),
    );
    return PlatformScaffold(
      appBar: PlatformAppBar(title: Text(subCategoryTitle)),
      body: pageBody,
    );
  }
}

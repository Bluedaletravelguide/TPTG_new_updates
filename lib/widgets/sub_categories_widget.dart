import '../screens/sub_categories_screen.dart';
import '../Data/SizeConfig.dart';
import '../screens/content_list_screen.dart';
import '../screens/tp_at_glance_screen.dart';
import 'package:flutter/material.dart';
import '../screens/taiping_history_screen.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

class SubCategories extends StatelessWidget {
  // Nature-inspired color palette
  static const Color primaryGreen = Color(0xFF2D5016);
  static const Color lightGreen = Color(0xFF4A7C29);
  static const Color accentGreen = Color(0xFF6B9D3A);
  static const Color softGreen = Color(0xFF8FBC5A);
  static const Color paleGreen = Color(0xFFE8F5E1);
  static const Color creamWhite = Color(0xFFFAFDF8);

  final String title;
  final String id;
  final String image;
  final String description;
  final String yearleft;
  final String yearright;
  final String descriptionleft;
  final String descriptionright;
  final Color colorR1;
  final Color colorR2;
  final Color colorL1;
  final Color colorL2;

  const SubCategories({
    required this.image,
    required this.title,
    required this.id,
    required this.description,
    required this.yearleft,
    required this.yearright,
    required this.descriptionleft,
    required this.descriptionright,
    required this.colorR1,
    required this.colorR2,
    required this.colorL1,
    required this.colorL2,
  });

  void selectSubCategory(BuildContext context) {
    if (id == 'sc1') {
      Navigator.of(context).push(
        platformPageRoute(
          context: context,
          builder: (context) => TpAtGlanceScreen(
            appbartitle: title,
            id: id,
            yearleft: yearleft,
            yearright: yearright,
            descriptionleft: descriptionleft,
            descriptionright: descriptionright,
            colorR1: colorR1,
            colorR2: colorR2,
            colorL1: colorL1,
            colorL2: colorL2,
          ),
        ),
      );
    } else if (id == 'sc_18') {
      Navigator.of(context).push(
        platformPageRoute(
          context: context,
          builder: (context) => SubCategoriesScreen(
            key: Key(id),
            appbartitle: title,
            id: id,
          ),
        ),
      );
    } else {
      Navigator.of(context).push(
        platformPageRoute(
          context: context,
          builder: (context) => ContentListScreen(
            key: Key(id),
            appbartitle: title,
            id: id,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final media = MediaQuery.of(context).size.width;
    return LayoutBuilder(
      builder: (context, constraints) {
        return InkWell(
          splashColor: softGreen.withOpacity(0.4),
          borderRadius: BorderRadius.circular(20),
          onTap: () => selectSubCategory(context),
          onLongPress: () => print(id),
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            elevation: 0,
            color: Colors.white,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: softGreen.withOpacity(0.4),
                  width: 2,
                ),
              ),
              child: Column(
                children: <Widget>[
                  Container(
                    height: constraints.maxHeight * 0.72,
                    child: Stack(
                      children: <Widget>[
                        ClipRRect(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(18),
                            topRight: Radius.circular(18),
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.1),
                                  blurRadius: 8,
                                  offset: Offset(0, 2),
                                ),
                              ],
                            ),
                            child: Image.asset(
                              image,
                              height: double.infinity,
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        // Gradient overlay for better text readability
                        Positioned(
                          bottom: 0,
                          left: 0,
                          right: 0,
                          height: 100,
                          child: Container(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  Colors.transparent,
                                  Colors.black.withOpacity(0.7),
                                ],
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 12,
                          left: 12,
                          right: 12,
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  primaryGreen.withOpacity(0.95),
                                  lightGreen.withOpacity(0.95),
                                ],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              ),
                              borderRadius: BorderRadius.circular(12),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.3),
                                  blurRadius: 8,
                                  offset: Offset(0, 2),
                                ),
                              ],
                            ),
                            child: Text(
                              title,
                              style: TextStyle(
                                fontSize: media > 500 ? 20 : 17,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                letterSpacing: 0.5,
                              ),
                              softWrap: true,
                              overflow: TextOverflow.fade,
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                      decoration: BoxDecoration(
                        color: paleGreen.withOpacity(0.3),
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(18),
                          bottomRight: Radius.circular(18),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            padding: EdgeInsets.all(6),
                            decoration: BoxDecoration(
                              color: accentGreen.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Icon(
                              Icons.arrow_forward_ios,
                              size: MediaQuery.of(context).size.height * 0.022,
                              color: primaryGreen,
                            ),
                          ),
                          SizedBox(width: 10),
                          Expanded(
                            child: Text(
                              description,
                              style: TextStyle(
                                fontSize: media > 500 ? 14 : 13,
                                color: primaryGreen,
                                fontWeight: FontWeight.w600,
                                height: 1.3,
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
import '../screens/sub_categories_screen.dart';
import '../Data/SizeConfig.dart';
import '../screens/content_list_screen.dart';
import '../screens/tp_at_glance_screen.dart';
import 'package:flutter/material.dart';
import '../screens/taiping_history_screen.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

class SubCategories extends StatelessWidget {
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
          splashColor: Theme.of(context).colorScheme.secondary,
          borderRadius: BorderRadius.circular(15),
          onTap: () => selectSubCategory(context),
          onLongPress: () => print(id),
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            elevation: 4,
            child: Column(
              children: <Widget>[
                Container(
                  height: constraints.maxHeight * 0.75,
                  child: Stack(
                    children: <Widget>[
                      ClipRRect(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15),
                          topRight: Radius.circular(15),
                        ),
                        child: Image.asset(
                          image,
                          height: double.infinity,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Positioned(
                        bottom: 20,
                        right: 4,
                        child: Container(
                          width: media > 500 ? media * 0.8 / 2 : media * 0.54,
                          color: Colors.black54,
                          padding:
                              EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                          child: Text(title,
                              style: media > 500
                                  ? Theme.of(context).textTheme.titleLarge
                                  : Theme.of(context).textTheme.headlineSmall,
                              softWrap: true,
                              overflow: TextOverflow.fade,
                              textAlign: TextAlign.center),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(Icons.arrow_forward_ios,
                              size: MediaQuery.of(context).size.height * 0.025),
                          SizedBox(width: 6),
                          Expanded(
                            child: Text(description,
                                style: Theme.of(context).textTheme.bodySmall),
                          ),
                        ]),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

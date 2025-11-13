import '../screens/travel_tips_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import '../screens/sub_categories_screen.dart';

class Catgeories extends StatelessWidget {
  final String id;
  final String title;
  final Color color;
  final String image;

  const Catgeories(
    this.id,
    this.title,
    this.color,
    this.image,
  );

  void selectCategory(BuildContext context) {
    if (id == 'c1') {
      Navigator.of(context).push(platformPageRoute(
        context: context,
        builder: (context) => TravelTipsScreen(
          key: Key('travel_tips'),
          appbartitle: 'Travel Tips',
        ),
      ));
    } else {
      Navigator.of(context).push(platformPageRoute(
          context: context,
          builder: (context) => new SubCategoriesScreen(
                key: Key(id),
                appbartitle: title,
                id: id,
              )));
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => selectCategory(context),
      child: Container(
        decoration: BoxDecoration(
          gradient: new LinearGradient(
            colors: [
              color,
              Colors.blueGrey,
            ],
            begin: Alignment.center,
            end: new Alignment(1, 1),
          ),
        ),
        child: Stack(children: [
          Opacity(
            opacity: 0.8,
            child: Container(
              decoration: new BoxDecoration(
                image: DecorationImage(
                  image: new AssetImage(image),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 30,
            left: 0,
            child: Container(
                width: MediaQuery.of(context).size.width * 0.5,
                padding: EdgeInsets.only(right: 30.0),
                decoration: BoxDecoration(
                  color: Colors.black87,
                  gradient: LinearGradient(
                    colors: <Color>[
                      Colors.black,
                      Colors.black54,
                      Colors.black38,
                    ],
                  ),
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(30),
                      topRight: Radius.circular(30)),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Text(
                    title,
                    style: MediaQuery.of(context).size.width > 500
                        ? Theme.of(context).textTheme.titleLarge
                        : Theme.of(context).textTheme.headlineSmall,
                    overflow: TextOverflow.fade,
                    softWrap: true,
                    textAlign: TextAlign.left,
                  ),
                )),
          ),
        ]),
      ),
    );
  }
}

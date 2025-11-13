import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import '../Data/categories_data.dart';
import '../widgets/categories_widget.dart';

class CategoriesScreen extends StatefulWidget {
  static const routeName = '/categories';
  @override
  _CategoriesScreenState createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  @override
  Widget build(BuildContext context) {
    return PlatformScaffold(
      body: GridView.count(
        crossAxisCount: 1,
        childAspectRatio: MediaQuery.of(context).size.width > 500 ? 3.5 : 2.7,
        children: CategoriesData.map(
          (con) => Catgeories(
            con.id,
            con.title,
            con.color,
            con.image,
          ),
        ).toList(),
      ),
    );
  }
}

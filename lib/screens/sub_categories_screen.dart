import 'package:flutter/material.dart';
import '../Data/sub_categories_data.dart';
import '../widgets/sub_categories_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

class SubCategoriesScreen extends StatelessWidget {
  static const routeName = '/sub_categories_screen';

  final String id;
  final String appbartitle;

  const SubCategoriesScreen(
      {required Key key, required this.id, required this.appbartitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final subCategoryTitle = appbartitle;
    final subCategoryId = id;
    final media = MediaQuery.of(context).size.width;
    final subCategory = SubCategoriesData.where((subCategory) {
      return subCategory.categories.contains(subCategoryId);
    }).toList();
    final pageBody = SafeArea(
      child: Material(
        child: GridView.builder(
          itemBuilder: (ctx, index) {
            return SubCategories(
              title: subCategory[index].subCategoryTitle,
              id: subCategory[index].id,
              image: subCategory[index].image,
              description: subCategory[index].description,
              yearleft: subCategory[index].yearleft,
              yearright: subCategory[index].yearright,
              descriptionleft: subCategory[index].descriptionleft,
              descriptionright: subCategory[index].descriptionright,
              colorR1: subCategory[index].colorR1,
              colorR2: subCategory[index].colorR2,
              colorL1: subCategory[index].colorL1,
              colorL2: subCategory[index].colorL2,
            );
          },
          itemCount: subCategory.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: media > 500 ? 2 : 1,
            childAspectRatio: media > 500 ? 1 : 1.35,
            crossAxisSpacing: media > 500 ? 15 : 4,
            mainAxisSpacing: media > 500 ? 15 : 3,
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

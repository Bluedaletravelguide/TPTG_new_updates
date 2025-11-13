import 'package:flutter/material.dart';
import '../Data/sub_categories_data.dart';
import '../widgets/sub_categories_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

class SubCategoriesScreen extends StatelessWidget {
  static const routeName = '/sub_categories_screen';

  // Nature-inspired color palette
  static const Color primaryGreen = Color(0xFF2D5016);
  static const Color lightGreen = Color(0xFF4A7C29);
  static const Color accentGreen = Color(0xFF6B9D3A);
  static const Color softGreen = Color(0xFF8FBC5A);
  static const Color paleGreen = Color(0xFFE8F5E1);
  static const Color creamWhite = Color(0xFFFAFDF8);

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

    final pageBody = Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [creamWhite, paleGreen, creamWhite],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          stops: [0.0, 0.5, 1.0],
        ),
      ),
      child: SafeArea(
        child: Column(
          children: [
            // Decorative header with count
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 16, horizontal: 20),
              margin: EdgeInsets.only(bottom: 12),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [lightGreen.withOpacity(0.15), accentGreen.withOpacity(0.08)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(25),
                  bottomRight: Radius.circular(25),
                ),
                boxShadow: [
                  BoxShadow(
                    color: lightGreen.withOpacity(0.1),
                    blurRadius: 8,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: accentGreen.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Icon(
                      Icons.grid_view_rounded,
                      color: primaryGreen,
                      size: 24,
                    ),
                  ),
                  SizedBox(width: 12),
                  Text(
                    '${subCategory.length} ${subCategory.length == 1 ? 'Category' : 'Categories'}',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: primaryGreen,
                      letterSpacing: 0.3,
                    ),
                  ),
                ],
              ),
            ),

            // Grid view
            Expanded(
              child: Material(
                color: Colors.transparent,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: media > 500 ? 16 : 12,
                    vertical: 8,
                  ),
                  child: GridView.builder(
                    physics: BouncingScrollPhysics(),
                    itemBuilder: (ctx, index) {
                      return Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: lightGreen.withOpacity(0.15),
                              blurRadius: 12,
                              offset: Offset(0, 4),
                            ),
                          ],
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: SubCategories(
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
                          ),
                        ),
                      );
                    },
                    itemCount: subCategory.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: media > 500 ? 2 : 1,
                      childAspectRatio: media > 500 ? 1 : 1.35,
                      crossAxisSpacing: media > 500 ? 18 : 8,
                      mainAxisSpacing: media > 500 ? 18 : 12,
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
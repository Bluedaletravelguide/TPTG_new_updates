import 'dart:ui';

class SubCategory {
  final String id;
  final String subCategoryTitle;
  final String categories;
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

  const SubCategory({
    required this.id,
    required this.categories,
    required this.subCategoryTitle,
    required this.image,
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
}

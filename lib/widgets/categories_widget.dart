import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import '../screens/travel_tips_screen.dart';
import '../screens/sub_categories_screen.dart';

class Catgeories extends StatelessWidget {
  final String id;
  final String title;
  final Color color;
  final String image;

  static const Color primaryGreen = Color(0xFF2E7D32);
  static const Color darkGreen = Color(0xFF1B5E20);
  static const Color white = Colors.white;

  Catgeories(
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
        builder: (context) => SubCategoriesScreen(
          key: Key(id),
          appbartitle: title,
          id: id,
        ),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectCategory(context),
      borderRadius: BorderRadius.circular(20),
      child: Container(
        height: 180,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: primaryGreen.withOpacity(0.15),
              blurRadius: 12,
              offset: Offset(0, 6),
            ),
          ],
        ),
        child: Stack(
          children: [
            // Background Image
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Container(
                width: double.infinity,
                height: double.infinity,
                child: Image.asset(
                  image,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            // Gradient Overlay
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.black.withOpacity(0.1),
                    Colors.black.withOpacity(0.6),
                  ],
                ),
              ),
            ),
            // Green accent overlay
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    primaryGreen.withOpacity(0.3),
                    Colors.transparent,
                  ],
                ),
              ),
            ),
            // Content
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                      decoration: BoxDecoration(
                        color: white.withOpacity(0.25),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: white.withOpacity(0.3),
                          width: 1,
                        ),
                      ),
                      child: Text(
                        'EXPLORE',
                        style: TextStyle(
                          color: white,
                          fontSize: 10,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 1.5,
                        ),
                      ),
                    ),
                    SizedBox(height: 12),
                    Text(
                      title,
                      style: TextStyle(
                        color: white,
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 0.5,
                        height: 1.2,
                        shadows: [
                          Shadow(
                            color: Colors.black.withOpacity(0.3),
                            offset: Offset(0, 2),
                            blurRadius: 4,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 8),
                    Row(
                      children: [
                        Text(
                          'Learn more',
                          style: TextStyle(
                            color: white.withOpacity(0.9),
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(width: 6),
                        Icon(
                          Icons.arrow_forward_rounded,
                          color: white,
                          size: 18,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            // Top right accent
            Positioned(
              top: 16,
              right: 16,
              child: Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: white.withOpacity(0.25),
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: white.withOpacity(0.3),
                    width: 1,
                  ),
                ),
                child: Icon(
                  Icons.bookmark_border_rounded,
                  color: white,
                  size: 20,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
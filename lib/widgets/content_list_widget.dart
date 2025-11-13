import '../screens/content_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'bookmark_widget.dart';

class ContentList extends StatelessWidget {
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
  final bool isBookmarked;
  final void Function(bool isBookmark) onBookmarkChanged;

  const ContentList(
      {required this.image,
        required this.title,
        required this.id,
        required this.description,
        required this.isBookmarked,
        required this.onBookmarkChanged});

  void selectContentList(BuildContext context) {
    Navigator.of(context).push(
      platformPageRoute(
        context: context,
        builder: (context) => new ContentScreen(
          key: Key(id),
          appbartitle: title,
          id: id,
          image: image,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: softGreen.withOpacity(0.3),
      borderRadius: BorderRadius.circular(20),
      autofocus: true,
      onTap: () => selectContentList(context),
      onLongPress: () => print(id),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        elevation: 0,
        color: Colors.white,
        margin: EdgeInsets.all(4),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: softGreen.withOpacity(0.4),
              width: 2,
            ),
            boxShadow: [
              BoxShadow(
                color: lightGreen.withOpacity(0.15),
                blurRadius: 12,
                offset: Offset(0, 4),
              ),
            ],
          ),
          child: LayoutBuilder(
            builder: (context, constraints) {
              return Column(
                children: [
                  // Image section with gradient overlay
                  Container(
                    height: constraints.maxHeight * 0.75,
                    child: Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(18),
                            topRight: Radius.circular(18),
                          ),
                          child: Image.asset(
                            image,
                            height: double.infinity,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ),
                        // Gradient overlay for better text/icon visibility
                        Positioned(
                          bottom: 0,
                          left: 0,
                          right: 0,
                          height: 60,
                          child: Container(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  Colors.transparent,
                                  Colors.black.withOpacity(0.3),
                                ],
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Bottom section with bookmark and title
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                      decoration: BoxDecoration(
                        color: paleGreen.withOpacity(0.25),
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(18),
                          bottomRight: Radius.circular(18),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          // Bookmark widget
                          Container(
                            height: 50,
                            width: 50,
                            child: BookmarkWidget(
                              key: Key(id),
                              onBookmarkChanged: onBookmarkChanged,
                              isBookmark: isBookmarked,
                            ),
                          ),

                          SizedBox(width: 8),

                          // Title with icon
                          Expanded(
                            child: Row(
                              children: [
                                Container(
                                  padding: EdgeInsets.all(6),
                                  decoration: BoxDecoration(
                                    color: accentGreen.withOpacity(0.15),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Icon(
                                    Icons.location_on,
                                    size: 18,
                                    color: primaryGreen,
                                  ),
                                ),
                                SizedBox(width: 8),
                                Expanded(
                                  child: Text(
                                    title,
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      color: primaryGreen,
                                      height: 1.2,
                                    ),
                                    softWrap: true,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
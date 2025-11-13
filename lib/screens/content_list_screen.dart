import 'package:flutter/material.dart';
import '../models/content_List.dart';
import '../models/bookmark.dart';
import '../Data/content_list_data.dart';
import '../widgets/content_list_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

class ContentListScreen extends StatefulWidget {
  static const routeName = '/content_list';

  // Nature-inspired color palette
  static const Color primaryGreen = Color(0xFF2D5016);
  static const Color lightGreen = Color(0xFF4A7C29);
  static const Color accentGreen = Color(0xFF6B9D3A);
  static const Color softGreen = Color(0xFF8FBC5A);
  static const Color paleGreen = Color(0xFFE8F5E1);
  static const Color creamWhite = Color(0xFFFAFDF8);

  final String appbartitle;
  final String id;

  ContentListScreen(
      {required Key key, required this.appbartitle, required this.id})
      : super(key: key);

  final PinBookmarks bookmark = PinBookmarks();

  updateBookmark(ContentLi cl, bool isPin) {
    if (isPin) {
      bookmark.addBookmark(cl);
    } else {
      bookmark.removeBookmark(cl);
    }
  }

  @override
  _ContentListScreenState createState() => _ContentListScreenState();
}

class _ContentListScreenState extends State<ContentListScreen> {
  // Nature-inspired color palette
  static const Color primaryGreen = Color(0xFF2D5016);
  static const Color lightGreen = Color(0xFF4A7C29);
  static const Color accentGreen = Color(0xFF6B9D3A);
  static const Color softGreen = Color(0xFF8FBC5A);
  static const Color paleGreen = Color(0xFFE8F5E1);
  static const Color creamWhite = Color(0xFFFAFDF8);

  @override
  Widget build(BuildContext context) {
    final contentListTitle = widget.appbartitle;
    final contentListId = widget.id;
    final contentList = ContentListData.where((contentList) {
      return contentList.categories.contains(contentListId);
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
                      Icons.location_on,
                      color: primaryGreen,
                      size: 24,
                    ),
                  ),
                  SizedBox(width: 12),
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${contentList.length} ${contentList.length == 1 ? 'Place' : 'Places'}',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: primaryGreen,
                            letterSpacing: 0.3,
                          ),
                        ),
                        Text(
                          'Tap to explore details',
                          style: TextStyle(
                            fontSize: 12,
                            color: primaryGreen.withOpacity(0.7),
                            letterSpacing: 0.2,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // Grid view
            Expanded(
              child: Material(
                color: Colors.transparent,
                child: GridView.builder(
                  physics: BouncingScrollPhysics(),
                  padding: EdgeInsets.fromLTRB(12, 8, 12, 20),
                  itemBuilder: (ctx, index) {
                    return ContentList(
                      id: contentList[index].id,
                      title: contentList[index].contentListTitle,
                      image: contentList[index].image,
                      description: contentList[index].description,
                      isBookmarked: widget.bookmark.isBookmark(contentList[index]),
                      onBookmarkChanged: (isBookmarked) {
                        setState(() {
                          widget.updateBookmark(contentList[index], isBookmarked);
                        });
                      },
                    );
                  },
                  itemCount: contentList.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.85,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
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
          contentListTitle,
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
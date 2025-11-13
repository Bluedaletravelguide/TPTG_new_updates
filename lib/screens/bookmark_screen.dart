import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import '../widgets/content_list_widget.dart';
import '../models/bookmark.dart';
import '../models/content_List.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

class BookmarkScreen extends StatefulWidget {
  static const routeName = '/bookmarks';
  final PinBookmarks bookmarks = PinBookmarks();

  _BookmarkScreenState createState() => _BookmarkScreenState();
}

class _BookmarkScreenState extends State<BookmarkScreen> {
  void initState() {
    super.initState();
    loadData();
  }

  @override
  Widget build(BuildContext context) {
    final List<ContentLi> bmarks = widget.bookmarks.bookmarks;
    final pageBody = SafeArea(
      child: Material(
        child: GridView.builder(
          padding: EdgeInsets.all(8),
          itemBuilder: (ctx, index) {
            return ContentList(
              id: bmarks[index].id,
              title: bmarks[index].contentListTitle,
              image: bmarks[index].image,
              description: bmarks[index].description,
              isBookmarked: bmarks[index].isBookmarked,
              onBookmarkChanged: (isBookmarked) {
                setState(() {
                  final updatedItem =
                      bmarks[index].copyWith(isBookmarked: isBookmarked);
                  bmarks[index] = updatedItem;
                  if (isBookmarked) {
                    widget.bookmarks.addBookmark(updatedItem);
                  } else {
                    widget.bookmarks.removeBookmark(updatedItem);
                  }
                });
              },
            );
          },
          itemCount: bmarks.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.97,
            crossAxisSpacing: 4,
            mainAxisSpacing: 3,
          ),
        ),
      ),
    );
    return PlatformScaffold(
      body: pageBody,
    );
  }

  loadData() async {
    List<ContentLi> bmarks = await widget.bookmarks.readAllBookmarks();
    setState(() {
      widget.bookmarks.bookmarks = bmarks;
    });
  }
}

import 'package:flutter/material.dart';
import '../models/content_List.dart';
import '../models/bookmark.dart';
import '../Data/content_list_data.dart';
import '../widgets/content_list_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

class ContentListScreen extends StatefulWidget {
  static const routeName = '/content_list';
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
  @override
  Widget build(BuildContext context) {
    final contentListTitle = widget.appbartitle;
    final contentListId = widget.id;
    final contentList = ContentListData.where((contentList) {
      return contentList.categories.contains(contentListId);
    }).toList();
    final pageBody = SafeArea(
      child: Material(
        child: GridView.builder(
          padding: EdgeInsets.all(8),
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
                });
          },
          itemCount: contentList.length,
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
      appBar: PlatformAppBar(title: Text(contentListTitle)),
      body: pageBody,
    );
  }
}

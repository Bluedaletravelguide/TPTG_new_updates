import 'package:flutter/material.dart';

class BookmarkWidget extends StatefulWidget {
  final void Function(bool isBookmark) onBookmarkChanged;
  final bool isBookmark;

  BookmarkWidget(
      {required Key key,
      required this.onBookmarkChanged,
      required this.isBookmark})
      : super(key: key);

  _BookmarkWidgetState createState() => _BookmarkWidgetState();
}

class _BookmarkWidgetState extends State<BookmarkWidget> {
  bool isBookmarked = false;

  @override
  void initState() {
    super.initState();
    //isBookmarked = widget.isBookmark;
  }

  void toggleBookmark() {
    setState(() {
      isBookmarked = !isBookmarked;
      widget.onBookmarkChanged(isBookmarked);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: IconButton(
        icon: isBookmarked ? Icon(Icons.bookmark) : Icon(Icons.bookmark_border),
        onPressed: toggleBookmark,
        iconSize: MediaQuery.of(context).size.height * 0.04,
      ),
    );
  }
}

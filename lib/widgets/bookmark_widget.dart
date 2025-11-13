import 'package:flutter/material.dart';

class BookmarkWidget extends StatefulWidget {
  // Nature-inspired color palette
  static const Color primaryGreen = Color(0xFF2D5016);
  static const Color lightGreen = Color(0xFF4A7C29);
  static const Color accentGreen = Color(0xFF6B9D3A);
  static const Color softGreen = Color(0xFF8FBC5A);
  static const Color paleGreen = Color(0xFFE8F5E1);

  final void Function(bool isBookmark) onBookmarkChanged;
  final bool isBookmark;

  BookmarkWidget(
      {required Key key,
        required this.onBookmarkChanged,
        required this.isBookmark})
      : super(key: key);

  _BookmarkWidgetState createState() => _BookmarkWidgetState();
}

class _BookmarkWidgetState extends State<BookmarkWidget>
    with SingleTickerProviderStateMixin {
  // Nature-inspired color palette
  static const Color primaryGreen = Color(0xFF2D5016);
  static const Color lightGreen = Color(0xFF4A7C29);
  static const Color accentGreen = Color(0xFF6B9D3A);
  static const Color softGreen = Color(0xFF8FBC5A);
  static const Color paleGreen = Color(0xFFE8F5E1);

  bool isBookmarked = false;
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    //isBookmarked = widget.isBookmark;

    // Initialize animation controller
    _animationController = AnimationController(
      duration: Duration(milliseconds: 300),
      vsync: this,
    );

    _scaleAnimation = Tween<double>(begin: 1.0, end: 1.3).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.elasticOut,
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void toggleBookmark() {
    setState(() {
      isBookmarked = !isBookmarked;
      widget.onBookmarkChanged(isBookmarked);

      // Trigger animation
      _animationController.forward().then((_) {
        _animationController.reverse();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          boxShadow: isBookmarked
              ? [
            BoxShadow(
              color: accentGreen.withOpacity(0.3),
              blurRadius: 8,
              offset: Offset(0, 2),
            ),
          ]
              : [],
        ),
        child: ScaleTransition(
          scale: _scaleAnimation,
          child: IconButton(
            icon: Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: isBookmarked
                    ? LinearGradient(
                  colors: [accentGreen, softGreen],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                )
                    : null,
                color: isBookmarked ? null : paleGreen.withOpacity(0.3),
                border: Border.all(
                  color: isBookmarked ? Colors.transparent : softGreen.withOpacity(0.5),
                  width: 2,
                ),
              ),
              child: Icon(
                isBookmarked ? Icons.bookmark : Icons.bookmark_border,
                color: isBookmarked ? Colors.white : primaryGreen,
              ),
            ),
            onPressed: toggleBookmark,
            iconSize: MediaQuery.of(context).size.height * 0.035,
            tooltip: isBookmarked ? 'Remove Bookmark' : 'Add Bookmark',
          ),
        ),
      ),
    );
  }
}
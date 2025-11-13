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
  // Nature-inspired green color palette
  static const Color primaryGreen = Color(0xFF2E7D32);
  static const Color accentGreen = Color(0xFF66BB6A);
  static const Color darkGreen = Color(0xFF1B5E20);
  static const Color lightGreen = Color(0xFFA5D6A7);
  static const Color paleGreen = Color(0xFFE8F5E9);
  static const Color white = Colors.white;

  bool _isLoading = true;

  void initState() {
    super.initState();
    loadData();
  }

  @override
  Widget build(BuildContext context) {
    final List<ContentLi> bmarks = widget.bookmarks.bookmarks;

    return PlatformScaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              paleGreen.withOpacity(0.3),
              white,
            ],
          ),
        ),
        child: SafeArea(
          child: _isLoading
              ? _buildLoadingState()
              : bmarks.isEmpty
              ? _buildEmptyState()
              : _buildBookmarksList(bmarks),
        ),
      ),
    );
  }

  Widget _buildLoadingState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(primaryGreen),
            strokeWidth: 3,
          ),
          SizedBox(height: 20),
          Text(
            'Loading your bookmarks...',
            style: TextStyle(
              color: darkGreen,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(32),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [primaryGreen.withOpacity(0.1), accentGreen.withOpacity(0.05)],
                ),
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.bookmark_border_rounded,
                size: 80,
                color: primaryGreen.withOpacity(0.5),
              ),
            ),
            SizedBox(height: 32),
            Text(
              'No Bookmarks Yet',
              style: TextStyle(
                color: darkGreen,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 12),
            Text(
              'Start exploring Taiping and save your favorite places here!',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.grey[600],
                fontSize: 16,
                height: 1.5,
              ),
            ),
            SizedBox(height: 32),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [primaryGreen, accentGreen],
                ),
                borderRadius: BorderRadius.circular(25),
                boxShadow: [
                  BoxShadow(
                    color: primaryGreen.withOpacity(0.3),
                    blurRadius: 8,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.explore, color: white, size: 20),
                  SizedBox(width: 8),
                  Text(
                    'Explore Taiping',
                    style: TextStyle(
                      color: white,
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBookmarksList(List<ContentLi> bmarks) {
    return CustomScrollView(
      physics: BouncingScrollPhysics(),
      slivers: [
        // Header
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [primaryGreen, darkGreen],
                        ),
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: primaryGreen.withOpacity(0.3),
                            blurRadius: 8,
                            offset: Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Icon(
                        Icons.bookmark,
                        color: white,
                        size: 24,
                      ),
                    ),
                    SizedBox(width: 16),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'My Bookmarks',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: darkGreen,
                          ),
                        ),
                        Text(
                          '${bmarks.length} saved ${bmarks.length == 1 ? "place" : "places"}',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey[600],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 16),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  decoration: BoxDecoration(
                    color: paleGreen.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: lightGreen.withOpacity(0.3),
                      width: 1,
                    ),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.info_outline,
                        color: primaryGreen,
                        size: 18,
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          'Tap any card to view details',
                          style: TextStyle(
                            color: darkGreen,
                            fontSize: 13,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),

        // Grid
        SliverPadding(
          padding: EdgeInsets.fromLTRB(12, 8, 12, 20),
          sliver: SliverGrid(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.75,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
            ),
            delegate: SliverChildBuilderDelegate(
                  (ctx, index) {
                return _buildBookmarkCard(bmarks, index);
              },
              childCount: bmarks.length,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildBookmarkCard(List<ContentLi> bmarks, int index) {
    return Container(
      decoration: BoxDecoration(
        color: white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 8,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: ContentList(
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

              // Show removal snackbar
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  behavior: SnackBarBehavior.floating,
                  backgroundColor: darkGreen,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  content: Row(
                    children: [
                      Icon(Icons.check_circle, color: white, size: 20),
                      SizedBox(width: 10),
                      Text(
                        'Bookmark removed',
                        style: TextStyle(color: white),
                      ),
                    ],
                  ),
                  duration: Duration(seconds: 2),
                ),
              );
            }
          });
        },
      ),
    );
  }

  loadData() async {
    setState(() {
      _isLoading = true;
    });

    List<ContentLi> bmarks = await widget.bookmarks.readAllBookmarks();

    setState(() {
      widget.bookmarks.bookmarks = bmarks;
      _isLoading = false;
    });
  }
}
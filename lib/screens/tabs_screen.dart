import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'bookmark_screen.dart';
import 'catgeroies_screen.dart';
import 'about_us_screen.dart';
import 'e-book_screen.dart';
import 'crosswordScreen.dart';
import 'contact_us_screen.dart';
import 'ios_menu_screen.dart';
import 'search_screen.dart';

class TabsScreen extends StatefulWidget {
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  // Nature-inspired green color palette
  static const Color primaryGreen = Color(0xFF2E7D32); // Deep forest green
  static const Color accentGreen = Color(0xFF66BB6A); // Light fresh green
  static const Color darkGreen = Color(0xFF1B5E20); // Dark forest
  static const Color lightGreen = Color(0xFFA5D6A7); // Pale green
  static const Color white = Colors.white;

  Widget bottomNav(Widget child, String text) {
    return CupertinoPageScaffold(
      child: SafeArea(child: Material(child: child)),
      navigationBar: CupertinoNavigationBar(
        backgroundColor: white,
        leading: Material(
          color: Colors.transparent,
          child: IconButton(
            icon: Icon(CupertinoIcons.list_bullet, color: primaryGreen),
            onPressed: () {
              Navigator.of(context).push(
                platformPageRoute(
                  context: context,
                  builder: (context) => new IosMenuScreen(),
                ),
              );
            },
          ),
        ),
        middle: Text(
          text,
          style: TextStyle(
            color: darkGreen,
            fontWeight: FontWeight.w600,
            fontSize: 18,
          ),
        ),
        trailing: Material(
          color: Colors.transparent,
          child: IconButton(
            onPressed: () {
              Navigator.of(context).push(
                platformPageRoute(
                  context: context,
                  builder: (context) => new SearchScreen(),
                ),
              );
            },
            icon: Icon(CupertinoIcons.search, color: primaryGreen),
          ),
        ),
      ),
    );
  }

  Widget createDrawerItems(BuildContext context) {
    return Drawer(
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [primaryGreen, darkGreen],
          ),
        ),
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.transparent,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: white.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Icon(
                      Icons.nature_people,
                      color: white,
                      size: 40,
                    ),
                  ),
                  SizedBox(height: 12),
                  Text(
                    'TAIPING',
                    style: TextStyle(
                      color: white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.5,
                    ),
                  ),
                  Text(
                    'THE GUIDE',
                    style: TextStyle(
                      color: lightGreen,
                      fontSize: 16,
                      letterSpacing: 2,
                    ),
                  ),
                ],
              ),
            ),
            _buildDrawerItem(
              context,
              icon: Icons.menu_book_rounded,
              title: 'E-book',
              onTap: () {
                Navigator.pop(context);
                Navigator.of(context).push(
                  platformPageRoute(
                    context: context,
                    builder: (context) => new FirstPage(),
                  ),
                );
              },
            ),
            _buildDrawerItem(
              context,
              icon: Icons.info_outline_rounded,
              title: 'About Us',
              onTap: () {
                Navigator.pop(context);
                Navigator.of(context).push(
                  platformPageRoute(
                    context: context,
                    builder: (context) => new AboutUsScreen(),
                  ),
                );
              },
            ),
            _buildDrawerItem(
              context,
              icon: Icons.grid_on_rounded,
              title: 'Crossword',
              onTap: () {
                Navigator.pop(context);
                Navigator.of(context).push(
                  platformPageRoute(
                    context: context,
                    builder: (context) => new CrosswordScreen(
                      title: 'Crossword',
                    ),
                  ),
                );
              },
            ),
            Divider(color: white.withOpacity(0.3), height: 40, thickness: 1),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Text(
                'Explore the beauty of Taiping',
                style: TextStyle(
                  color: lightGreen,
                  fontSize: 12,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDrawerItem(
    BuildContext context, {
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        leading: Container(
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: white.withOpacity(0.2),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(
            icon,
            color: white,
            size: 22,
          ),
        ),
        title: Text(
          title,
          style: TextStyle(
            color: white,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        onTap: onTap,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        hoverColor: white.withOpacity(0.1),
      ),
    );
  }

  final List<Map<String, Object>> _pages = [
    {
      'page': CategoriesScreen(),
      'title': 'TAIPING THE GUIDE',
    },
    {'page': BookmarkScreen(), 'title': 'My Bookmarks'},
    {
      'page': ContactUsScreen(),
      'title': 'Contact Us',
    },
  ];

  int _selectedPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<BottomNavigationBarItem> _items = [
      BottomNavigationBarItem(
        backgroundColor: primaryGreen,
        icon: Icon(Icons.explore_rounded),
        activeIcon: Icon(Icons.explore),
        label: 'Explore',
      ),
      BottomNavigationBarItem(
        backgroundColor: primaryGreen,
        icon: Icon(Icons.bookmark_border_rounded),
        activeIcon: Icon(Icons.bookmark),
        label: 'Bookmarks',
      ),
      BottomNavigationBarItem(
        backgroundColor: primaryGreen,
        icon: Icon(Icons.contact_mail_outlined),
        activeIcon: Icon(Icons.contact_mail),
        label: 'Contact',
      ),
    ];

    return Platform.isIOS
        ? CupertinoTabScaffold(
            tabBar: CupertinoTabBar(
              items: _items,
              backgroundColor: white,
              activeColor: primaryGreen,
              inactiveColor: Colors.grey,
            ),
            tabBuilder: (context, index) {
              switch (index) {
                case 1:
                  return bottomNav(BookmarkScreen(), 'My Bookmarks');
                case 2:
                  return bottomNav(ContactUsScreen(), 'Contact Us');
                default:
                  return bottomNav(CategoriesScreen(), 'TAIPING THE GUIDE');
              }
            },
          )
        : Scaffold(
            appBar: AppBar(
              elevation: 0,
              backgroundColor: primaryGreen,
              title: Row(
                children: [
                  Icon(Icons.nature_people, color: white, size: 24),
                  SizedBox(width: 10),
                  Text(
                    _pages[_selectedPageIndex]['title'] as String,
                    style: TextStyle(
                      color: white,
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                      letterSpacing: 0.5,
                    ),
                  ),
                ],
              ),
              actions: <Widget>[
                IconButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      platformPageRoute(
                        context: context,
                        builder: (context) => new SearchScreen(),
                      ),
                    );
                  },
                  icon: Container(
                    padding: EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      color: white.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Icon(Icons.search, color: white),
                  ),
                ),
                SizedBox(width: 8),
              ],
              iconTheme: IconThemeData(color: white),
            ),
            body: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    primaryGreen.withOpacity(0.05),
                    white,
                  ],
                ),
              ),
              child: _pages[_selectedPageIndex]['page'] as Widget,
            ),
            drawer: createDrawerItems(context),
            bottomNavigationBar: Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 10,
                    offset: Offset(0, -2),
                  ),
                ],
              ),
              child: BottomNavigationBar(
                onTap: _selectPage,
                backgroundColor: white,
                selectedItemColor: primaryGreen,
                unselectedItemColor: Colors.grey[400],
                currentIndex: _selectedPageIndex,
                type: BottomNavigationBarType.fixed,
                elevation: 0,
                selectedFontSize: 12,
                unselectedFontSize: 11,
                selectedLabelStyle: TextStyle(fontWeight: FontWeight.w600),
                items: _items,
              ),
            ),
          );
  }
}

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
  Widget bottomNav(Widget child, String text) {
    return CupertinoPageScaffold(
        child: SafeArea(child: Material(child: child)),
        navigationBar: CupertinoNavigationBar(
            leading: Material(
              color: Colors.transparent,
              child: IconButton(
                  icon: Icon(CupertinoIcons.list_bullet),
                  onPressed: () {
                    Navigator.of(context).push(platformPageRoute(
                        context: context,
                        builder: (context) => new IosMenuScreen()));
                  }),
            ),
            middle: Text(text),
            trailing: Material(
              color: Colors.transparent,
              child: IconButton(
                onPressed: () {
                  Navigator.of(context).push(
                    platformPageRoute(
                        context: context,
                        builder: (context) => new SearchScreen()),
                  );
                },
                icon: Icon(CupertinoIcons.search),
              ),
            )));
  }

  Widget createDrawerItems(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            child: Text('TAIPING THE GUIDE'),
            decoration: BoxDecoration(color: Colors.blue),
          ),
          ListTile(
            leading: Icon(
              Icons.book,
              color: Colors.black,
            ),
            title: Text(
              'E-book',
              style: TextStyle(color: Colors.black),
            ),
            onTap: () {
              Navigator.pop(context);
              Navigator.of(context).push(
                platformPageRoute(
                    context: context, builder: (context) => new FirstPage()),
              );
            },
          ),
          ListTile(
            leading: Icon(
              Icons.info,
              color: Colors.black,
            ),
            title: Text(
              'About Us',
              style: TextStyle(color: Colors.black),
            ),
            onTap: () {
              Navigator.pop(context);
              Navigator.of(context).push(
                platformPageRoute(
                    context: context,
                    builder: (context) => new AboutUsScreen()),
              );
            },
          ),
          ListTile(
            leading: Icon(
              Icons.games,
              color: Colors.black,
            ),
            title: Text(
              'Crossword',
              style: TextStyle(color: Colors.black),
            ),
            onTap: () {
              Navigator.pop(context);
              Navigator.of(context).push(
                platformPageRoute(
                    context: context,
                    builder: (context) => new CrosswordScreen(
                          title: 'Crossword',
                        )),
              );
            },
          )
        ],
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
        backgroundColor: Theme.of(context).primaryColorDark,
        icon: Icon(Icons.home),
        label: 'Home',
      ),
      BottomNavigationBarItem(
        backgroundColor: Theme.of(context).primaryColorDark,
        icon: Icon(Icons.bookmark),
        label: 'My Bookmarks',
      ),
      BottomNavigationBarItem(
          backgroundColor: Theme.of(context).primaryColorDark,
          icon: Icon(Icons.contacts),
          label: 'Contact Us'),
    ];

    return Platform.isIOS
        ? CupertinoTabScaffold(
            tabBar: CupertinoTabBar(
              items: _items,
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
              title: Text(_pages[_selectedPageIndex]['title'] as String),
              actions: <Widget>[
                IconButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      platformPageRoute(
                          context: context,
                          builder: (context) => new SearchScreen()),
                    );
                  },
                  icon: Icon(Icons.search),
                )
              ],
            ),
            body: _pages[_selectedPageIndex]['page'] as Widget,
            drawer: createDrawerItems(context),
            bottomNavigationBar: BottomNavigationBar(
                onTap: _selectPage,
                backgroundColor: Theme.of(context).primaryColorDark,
                unselectedItemColor: Colors.white70,
                selectedItemColor: Colors.white,
                currentIndex: _selectedPageIndex,
                type: BottomNavigationBarType.fixed,
                items: _items),
          );
  }
}

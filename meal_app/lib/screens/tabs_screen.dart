import 'package:flutter/material.dart';
import 'package:meal_app/screens/categories_screen.dart';
import 'package:meal_app/screens/favorites_screen.dart';
import 'package:meal_app/screens/main_drawer.dart';

class TabsScreen extends StatefulWidget {
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  final List<Map<String, dynamic>> _pages = [
    {'page': CategoriesScreen(), 'title': 'Categories'},
    {'page': FavoritesScreen(), 'title': 'Your Favorites'}
  ];
  int _selectedPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // return DefaultTabController(
    //   // initialIndex: 0,  => which screen should be displyed.
    //   length: 2,
    //   child: Scaffold(appBar: AppBar(title: Text("Meals"),bottom: TabBar(tabs: [
    //   Tab(
    //     icon: Icon(Icons.category),
    //     text: 'Categories',
    //   ),
    //   Tab(
    //     icon: Icon(Icons.star),
    //     text: 'Favorites',
    //   )
    // ],
    // ),
    // ),
    // body: TabBarView(children: [
    //   CategoriesScreen(),
    //   FavoritesScreen(),
    // ],),
    // ),
    // );
    //improved code......
    return Scaffold(
      drawer: MainDrawer(),
      appBar: AppBar(
        title: Text( _pages[_selectedPageIndex]['title']),
      ),
      body: _pages[_selectedPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).accentColor,
        currentIndex: _selectedPageIndex,
        type: BottomNavigationBarType.shifting,
        items: [
          BottomNavigationBarItem(
              backgroundColor: Theme.of(context).primaryColor,
              icon: Icon(Icons.category),
              title: Text('Categories')),
          BottomNavigationBarItem(
              icon: Icon(Icons.star), title: Text('Favorites'))
        ],
      ),
    );
  }
}

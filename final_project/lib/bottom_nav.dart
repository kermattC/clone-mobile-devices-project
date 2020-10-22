import 'package:flutter/material.dart';

import 'views/main_feed.dart';
import 'views/discover_feed.dart';

/**
 * Top level widget under the 'MyApp' widget
 * This widget is incharge of our bottom naviagtion and any top level state we might need
 */
class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // Manually making bottom nav items as using the map function
  // would require use to manually hold icon and text data in array anyway
  final navItems = <BottomNavigationBarItem>[
    BottomNavigationBarItem(
      icon: Icon(Icons.home),
      title: Text('Home'),
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.search),
      title: Text('Discover'),
      
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.person_add),
      title: Text('Friends'),
    )
  ];

  int _selectedIndex = 0;

  var pages = <Widget>[
    MainFeed(),
    DiscoverFeedPage(),
    // TODO eventually add other pages here
    // Make sure if you add another page here that there is enough icons in navItems
    // you'll get an error otherwise
    Text("I'm not a page yet but I am the third page")
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: pages[_selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          // set our state onTap, in this case our current page index,
          onTap: (int index) {
            setState(() {
              _selectedIndex = index;
            });
          },
          items: navItems,
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.purple[600],
        ));
  }
}
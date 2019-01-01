import 'package:flutter/material.dart';
import 'package:news_app_flutter/event/Eventbus.dart';
import 'package:news_app_flutter/event/events.dart';
import 'package:news_app_flutter/view/page/LoginPage.dart';
import 'package:news_app_flutter/view/widget/CategoryPageWidget.dart';
import 'package:news_app_flutter/view/widget/DashBoardWidget.dart';
import 'package:news_app_flutter/view/widget/FavouritePageWidget.dart';
import 'package:news_app_flutter/view/widget/ProfilePageWidget.dart';
import 'package:news_app_flutter/view/widget/VideoNewsPageWidget.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _navIndex = 0;

  void setIndex(int index) {
    setState(() {
      _navIndex = index;
    });
  }

  final List<Widget> _children = [
    DashBoardWidget(),
    CategoryPageWidget(),
    VideoNewsPageWidget(),
    FavouritePageWidget(),
    ProfilePageWidget()
  ];

  final List<String> _title = [
    'Home',
    'Category',
    'Video',
    'Favourite',
    'Profile',
  ];

  Widget viewForIndex(index) {
    if (index >= _children.length) {
      return Text("Not Set");
    }
    return _children[index];
  }

  String titleForIndex(index) {
    if (index >= _children.length) {
      return "Not Set";
    }
    return _title[index];
  }

  @override
  Widget build(BuildContext context) {
    // listenForAuthError(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(titleForIndex(_navIndex)),
        automaticallyImplyLeading: false,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _navIndex,
        fixedColor: Colors.red,
        items: [
          BottomNavigationBarItem(
            icon: new Icon(Icons.home),
            title: new Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.category),
            title: new Text('Category'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.video_library),
            title: Text('Video'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            title: Text('Favourite'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            title: Text('Profile'),
          ),
        ],
        onTap: (index) {
          setIndex(index);
        },
        type: BottomNavigationBarType.fixed,
      ),
      body: viewForIndex(_navIndex),
    );
  }

  void listenForAuthError(BuildContext context) {
    EventBusProvider.defaultInstance().on<AuthErrorEvent>().listen((event) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => LoginPage(),
        ),
      );
    });
  }
}

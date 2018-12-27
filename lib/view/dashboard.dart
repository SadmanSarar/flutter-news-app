import 'package:flutter/material.dart';
import 'dashboard_item.dart';

class DashBoard extends StatefulWidget {
  @override
  _DashBoardState createState() {
    return _DashBoardState();
  }
}

class _DashBoardState extends State<DashBoard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return new DashBoardItem(
            'Title',
            'Body',
            'https://picsum.photos/200/200',
            2,
            (id) {},
          );
        },
      ),
    );
  }
}

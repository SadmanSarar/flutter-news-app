import 'package:flutter/material.dart';
import 'dashboard_item.dart';

class Video extends StatefulWidget {
  @override
  _VideoState createState() {
    return _VideoState();
  }
}

class _VideoState extends State<Video> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemCount: 5,
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

import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';
import 'news_details.dart';

typedef DashBoardItemCallback = Function(int id);

class DashBoardItem extends StatelessWidget {
  final String imgUrl;
  final String title;
  final String body;
  final int id;
  final DashBoardItemCallback callback;

  const DashBoardItem(
    this.title,
    this.body,
    this.imgUrl,
    this.id,
    this.callback, {
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Container(
        child: Card(
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => NewsDetails()),
          );
          callback(id);
        },
        child: Column(
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(4.0),
                      topRight: Radius.circular(4.0),
                    ),
                    child: FadeInImage.memoryNetwork(
                      placeholder: kTransparentImage,
                      image: imgUrl,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 0.0,
                    left: 8.0,
                    right: 8.0,
                    bottom: 4.0,
                  ),
                  child: Text(
                    title,
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 23.0),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 0.0,
                    left: 8.0,
                    right: 8.0,
                    bottom: 4.0,
                  ),
                  child: Text(
                    body,
                    style: TextStyle(color: Colors.black87, fontSize: 16.0),
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    ));
  }
}

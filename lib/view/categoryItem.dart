import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

typedef CategoryCallback = void Function(int id);

class CategoryItem extends StatelessWidget {
  final String title;
  final String imgUrl;
  final int id;
  final Color color;
  final CategoryCallback callback;
  const CategoryItem(
    this.id,
    this.title,
    this.imgUrl,
    this.color,
    this.callback, {
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: color,
      child: InkWell(
        onTap: () {
          callback(id);
        },
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(
                top: 8.0,
                left: 8.0,
                right: 8.0,
              ),
              child: FadeInImage.memoryNetwork(
                placeholder: kTransparentImage,
                image: imgUrl,
                fit: BoxFit.contain,
                height: 120,
                width: 120,
              ),
            ),
            Text(
              title,
              style: buildHeadline(context),
            )
          ],
        ),
      ),
    );
  }

  TextStyle buildHeadline(BuildContext context) {
    return TextStyle(
      fontSize: 23,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';
import 'news_details.dart';
import '../api/news/model.dart';
import '../api/url.dart';

typedef NewsItemCallback = Function(int id);

class NewsListItem extends StatelessWidget {
  final News news;
  final NewsItemCallback callback;

  const NewsListItem(
    this.news,
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
            MaterialPageRoute(builder: (context) => NewsDetails(news)),
          );
          callback(news.id);
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
                      image: URL.imageUrl(news.image),
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
                    news.title,
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
                    news.body,
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

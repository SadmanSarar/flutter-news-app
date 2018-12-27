import 'package:flutter/material.dart';
import 'package:flutter_html_view/flutter_html_text.dart';
import 'package:flutter_youtube/flutter_youtube.dart';
import 'package:vibration/vibration.dart';

class NewsDetails extends StatefulWidget {
  NewsDetails({Key key}) : super(key: key);

  @override
  _NewsDetailsState createState() => _NewsDetailsState(0);
}

class _NewsDetailsState extends State<NewsDetails> {
  String _title;
  String _body;
  String _imgUrl;
  final int _id;

  final FlutterYoutube youtube = FlutterYoutube();

  _NewsDetailsState(this._id) {
    _title = 'Somehting';
    _body = '<h1>Somehting</h1>';
    _imgUrl =
        "https://images.pexels.com/photos/396547/pexels-photo-396547.jpeg?auto=compress&cs=tinysrgb&h=350";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              expandedHeight: 200.0,
              floating: false,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                title: Text(_title,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.0,
                    )),
                background: Image.network(
                  _imgUrl,
                  fit: BoxFit.cover,
                ),
                // background: Image(image: CachedNetworkImageProvider(_imgUrl)),
              ),
            ),
          ];
        },
        body: HtmlText(
          data: _body,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          FlutterYoutube.playYoutubeVideoByUrl(
              apiKey: "AIzaSyBLkHuG7jTPvaZl0LLi6aqP6-ypSv2ZCe0",
              videoUrl: "https://www.youtube.com/watch?v=811aNwrMSEU",
              autoPlay: true, //default falase
              fullScreen: true //default false
              );
        },
        elevation: 4.0,
        tooltip: 'Make Favourite',
        child: Icon(Icons.favorite),
      ),
    );
  }
}

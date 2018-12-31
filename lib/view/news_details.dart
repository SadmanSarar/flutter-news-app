import 'package:flutter/material.dart';
import 'package:flutter_html_view/flutter_html_text.dart';
import 'package:flutter_youtube/flutter_youtube.dart';
import '../api/news/model.dart';
import '../api/url.dart';
import '../api/news/repository.dart';

class NewsDetails extends StatefulWidget {
  News news;
  NewsDetails(this.news);
  @override
  _NewsDetailsState createState() => _NewsDetailsState(news);
}

class _NewsDetailsState extends State<NewsDetails> {
  NewsRepository _repository = NewsRepository.create();
  String _title;
  String _body;
  String _imgUrl;
  final FlutterYoutube youtube = FlutterYoutube();
  News _news;
  bool _isFavourite = false;
  _NewsDetailsState(News news) {
    _news = news;
    _title = news.title;
    _body = news.body;
    _imgUrl = URL.imageUrl(news.image);
  }

  @override
  void initState() {
    _repository.isFavouriteNews(_news.id).then((value) {
      setState(() {
        _isFavourite = value;
      });
    });
    super.initState();
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
          if (!_isFavourite) {
            _repository.saveFavNews(_news);
            setState(() {
              _isFavourite = true;
            });
          } else {
            _repository.removeFavNews(_news);
            setState(() {
              _isFavourite = false;
            });
          }
          /*
            FlutterYoutube.playYoutubeVideoByUrl(
                apiKey: "AIzaSyBLkHuG7jTPvaZl0LLi6aqP6-ypSv2ZCe0",
                videoUrl: "https://www.youtube.com/watch?v=811aNwrMSEU",
                autoPlay: true, //default falase
                fullScreen: true //default false
                );
          */
        },
        elevation: 4.0,
        tooltip: 'Make Favourite',
        child: _isFavourite ? Icon(Icons.cancel) : Icon(Icons.favorite),
      ),
    );
  }
}

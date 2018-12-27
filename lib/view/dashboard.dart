import 'package:flutter/material.dart';
import 'dashboard_item.dart';
import '../api/news/repository.dart';
import '../api/news/model.dart';
import '../api/url.dart';

class DashBoard extends StatefulWidget {
  @override
  _DashBoardState createState() {
    return _DashBoardState();
  }
}

class _DashBoardState extends State<DashBoard> {
  var repository = NewsRepository.create();

  List<News> _list = [];

  Future<Null> fetchData() {
    return repository.fetchAndGet().then((value) {
      setState(() {
        _list = value;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: _list.length == 0 ? buildEmptyView() : buildListView(),
    );
  }

  ListView buildListView() {
    return ListView.builder(
      itemCount: _list.length,
      itemBuilder: (context, index) {
        return new DashBoardItem(
          _list[index].title,
          _list[index].body,
          (_list[index].image == null || _list[index].image.isEmpty) ? 'https://picsum.photos/200/200' : URL.imageUrl(_list[index].image),
          _list[index].id,
          (id) {},
        );
      },
    );
  }

  Widget buildEmptyView() {
    return CircularProgressIndicator();
  }
}

import 'package:flutter/material.dart';
import 'categoryItem.dart';
import '../api/category/repository.dart';
import '../api/category/model.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import '../api/url.dart';

class CategoryPage extends StatefulWidget {
  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  RefreshController _refreshController;

  @override
  BuildContext get context => super.context;

  List<Category> _list = [];
  CategoryRepository repository = CategoryRepository.create();
  _CategoryPageState() {}

  void fetchData() {
    repository.fetchAndGet().then((value) {
      setState(() {
        _list = value;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    _refreshController = new RefreshController();
    fetchData();
  }

  final List<Color> _colorList = [
    Colors.blue,
    Colors.red,
    Colors.orange,
    Colors.green,
    Colors.pink,
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      child: _list.length == 0 ? emptyView() : getList(),
    );
  }

  Widget getList() {
    var size = MediaQuery.of(context).size;
    final double itemWidth = size.width / 3;
    final double itemHeight = 170;

    return SmartRefresher(
      enablePullDown: true,
      onRefresh: (up) {
        // fetchData();
        _refreshController.sendBack(true, RefreshStatus.idle);
        setState(() {});
      },
      controller: _refreshController,
      enableOverScroll: true,
      child: GridView.count(
        crossAxisCount: 3,
        childAspectRatio: itemWidth / itemHeight,
        shrinkWrap: true,
        children: List.generate(
          _list.length,
          (index) {
            print(_list[index].imageUrl);
            return new CategoryItem(
              _list[index].id,
              _list[index].name,
              (_list[index].imageUrl == null || _list[index].imageUrl.isEmpty)
                  ? 'https://picsum.photos/200/200'
                  : URL.imageUrl(_list[index].imageUrl),
              _colorList[index % _colorList.length],
              (id) {
                print('Clicked with Id: $id');
              },
            );
          },
        ),
      ),
    );
  }

  Widget emptyView() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }
}

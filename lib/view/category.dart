import 'package:flutter/material.dart';
import 'categoryItem.dart';
import '../api/category/repository.dart';
import '../api/category/model.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'category_details.dart';

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
    final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
        GlobalKey<RefreshIndicatorState>();
    return Container(
      child: RefreshIndicator(
        key: _refreshIndicatorKey,
        onRefresh: fetchData,
        child: Container(
          height: size.height,
          child: GridView.count(
            crossAxisCount: 3,
            childAspectRatio: itemWidth / itemHeight,
            shrinkWrap: true,
            children: List.generate(
              _list.length,
              (index) {
                var item = _list[index];
                return new CategoryItem(
                  item,
                  _colorList[index % _colorList.length],
                  (category) {
                    print('CategoryId: ${category.id}');
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => CategoryDetails(category),
                      ),
                    );
                  },
                );
              },
            ),
          ),
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

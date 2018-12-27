import 'package:flutter/material.dart';
import 'categoryItem.dart';
import '../api/category/repository.dart';
import '../api/category/model.dart';

class CategoryPage extends StatefulWidget {
  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  @override
  BuildContext get context => super.context;

  List<Category> _list = [];
  CategoryRepository repository = CategoryRepository.create();
  _CategoryPageState() {
    repository.fetchAndGet().then((value) {
      setState(() {
        _list = value;
      });
    });
  }

  @override
  void initState() {
    super.initState();
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
    var size = MediaQuery.of(context).size;
    final double itemWidth = size.width / 3;
    final double itemHeight = 170;

    return Container(
      child: GridView.count(
        crossAxisCount: 3,
        childAspectRatio: itemWidth / itemHeight,
        shrinkWrap: true,
        children: List.generate(
          _list.length,
          (index) {
            return new CategoryItem(
              _list[index].id,
              _list[index].name,
              'https://picsum.photos/200/200',
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
}

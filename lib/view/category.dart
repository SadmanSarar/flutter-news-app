import 'package:flutter/material.dart';
import 'categoryItem.dart';

class CategoryPage extends StatefulWidget {
  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  @override
  // TODO: implement context
  BuildContext get context => super.context;

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
          10,
          (index) {
            return new CategoryItem(
              index,
              'Item $index',
              'https://picsum.photos/200/200',
              _colorList[index%_colorList.length],
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

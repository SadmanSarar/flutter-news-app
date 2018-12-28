import 'service.dart';
import '../../database/appDataBase.dart';
import 'dart:async';
import '../category/model.dart';

class CategoryRepository {
  CategoryRemoteService remoteService;

  CategoryRepository(this.remoteService);

  factory CategoryRepository.create() {
    return CategoryRepository(
      CategoryRemoteService(),
    );
  }

  Future<List<Category>> fetchAndGet() async {
    var categories = remoteService.fetchCategory('1234');
    var data = await categories;
    var database = await AppDatabase.openMyDatabase();
    database.deleteAllCategory();
    data.forEach((item) {
      database.createCategory(
        item.id,
        item.name,
        item.imageUrl,
        item.description,
      );
    });
    var dummy = await database.getAllCategory();
    dummy.forEach((item){
      print(item.toString());
    }); 
    return database.getAllCategory();
  }
}

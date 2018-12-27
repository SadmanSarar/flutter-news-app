import 'service.dart';
import '../../database/appDataBase.dart';
import 'dart:async';
import 'model.dart';

class NewsRepository {
  NewsRemoteService remoteService;

  NewsRepository(this.remoteService);

  factory NewsRepository.create() {
    return NewsRepository(
      NewsRemoteService(),
    );
  }

  Future<List<News>> fetchAndGet() async {
    var categories = remoteService.fetchNews('1234');
    var data = await categories;
    var database = await AppDatabase.openMyDatabase();
    database.deleteAllNews();
    data.forEach((item) {
      database.createNews(
        item.id,
        item.title,
        item.body,
        item.image,
        item.categoryId,
        item.type,
        item.published,
        item.publishedAt,
        item.categoryName,
      );
    });
    var dummy = await database.getAllNews();
    dummy.forEach((item) {
      print(item.toString());
    });
    return database.getAllNews();
  }
}

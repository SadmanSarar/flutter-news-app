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
    var future = remoteService.fetchNews(
      '1234',
      '',
      '',
    );
    return await fetchNews(future);
  }

  Future<List<News>> fetchNewsType(String type) async {
    var future = remoteService.fetchNews(
      '1234',
      type,
      '',
    );
    return await fetchNews(future);
  }

  Future<List<News>> fetchNewsCategory(int categoryId) async {
    var future = remoteService.fetchNews(
      '1234',
      '',
      categoryId.toString(),
    );
    return await fetchNews(future);
  }

  fetchNews(Future<List<News>> future) async {
    var data = await future;
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
    return database.getAllNews();
  }
}

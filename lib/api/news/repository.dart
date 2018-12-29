import 'service.dart';
import '../../database/appDataBase.dart';
import 'dart:async';
import 'model.dart';
import '../settings/repository.dart';

class NewsRepository {
  NewsRemoteService remoteService;

  SettingRepository settings;
  NewsRepository(this.remoteService, this.settings);

  factory NewsRepository.create() {
    return NewsRepository(
      NewsRemoteService(),
      SettingRepository.create(),
    );
  }

  Future<List<News>> fetchAndGet(String type, String categoryId) async {
    var apiToken = await settings.getApiToken();
    var future = remoteService.fetchNews(
      apiToken,
      type,
      categoryId,
    );
    return await fetchNews(future, type, categoryId);
  }

  fetchNews(Future<List<News>> future, String type, String categoryId) async {
    var data = await future;
    var database = await AppDatabase.openMyDatabase();
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
    if (type.isEmpty && categoryId.isEmpty) {
      return database.getAllNews();
    }
    if (type.isNotEmpty && categoryId.isNotEmpty) {
      return database.getAllNewsForCategoryAndType(int.parse(categoryId), type);
    }
    if (type.isNotEmpty) {
      return database.getAllNewsByType(type);
    } else {
      return database.getAllNewsForCategory(int.parse(categoryId));
    }
  }
}

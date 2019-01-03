import 'dart:async';

import 'package:news_app_flutter/data/database/appDataBase.dart';
import 'package:news_app_flutter/data/news/News.dart';
import 'package:news_app_flutter/data/news/NewsRemoteService.dart';
import 'package:news_app_flutter/data/settings/SettingRepository.dart';
import 'package:news_app_flutter/event/Eventbus.dart';
import 'package:news_app_flutter/event/events.dart';


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
    var database = await AppDatabase.openMyDatabase();

    if (type == 'fav') {
      return database.getFavNews();
    }

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
    data.forEach((item) async {
      var _news = await database.getNewsById(item.id);
      if(_news != null){
      database.deleteNews(item.id);
      }
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

  saveFavNews(News news) async {
    var database = await AppDatabase.openMyDatabase();
    database.deleteFavNews(news.id);
    database.createFavNews(
        news.id,
        news.title,
        news.body,
        news.image,
        news.categoryId,
        news.type,
        news.published,
        news.publishedAt,
        news.categoryName);

    EventBusProvider.defaultInstance().fire(new FavNewsUpdateEvent());
  }

  removeFavNews(News news) async {
    var database = await AppDatabase.openMyDatabase();
    database.deleteFavNews(news.id);
    EventBusProvider.defaultInstance().fire(new FavNewsUpdateEvent());
  }

  Future<bool> isFavouriteNews(int id) async {
    var database = await AppDatabase.openMyDatabase();
    var news = await database.getFavNewsById(id);
    if (news == null) {
      return false;
    } else {
      return true;
    }
  }
}

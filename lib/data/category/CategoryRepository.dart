import 'dart:async';

import 'package:news_app_flutter/data/category/Category.dart';
import 'package:news_app_flutter/data/category/CategoryRemoteService.dart';
import 'package:news_app_flutter/data/database/appDataBase.dart';
import 'package:news_app_flutter/data/settings/SettingRepository.dart';

class CategoryRepository {
  CategoryRemoteService remoteService;
  SettingRepository settings;

  CategoryRepository(this.remoteService, this.settings);

  factory CategoryRepository.create() {
    return CategoryRepository(
        CategoryRemoteService(), SettingRepository.create());
  }

  Future<List<Category>> fetchAndGet() async {
    var apiToken = await settings.getApiToken();
    var categories = remoteService.fetchCategory(apiToken);
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
    dummy.forEach((item) {
      print(item.toString());
    });
    return database.getAllCategory();
  }
}

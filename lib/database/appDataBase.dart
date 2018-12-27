import 'package:tinano/tinano.dart';
import 'dart:async';
import '../api/category/model.dart';
part 'appDatabase.g.dart'; // this is important!

@TinanoDb(name: "news_app.sqlite", schemaVersion: 1)
abstract class AppDatabase {
  static DatabaseBuilder<AppDatabase> createBuilder() => _$createAppDatabase();

  @Query("SELECT COUNT(*) FROM categories")
  Future<int> getAllCategoryCount();

  @Query("SELECT * FROM categories")
  Future<List<Category>> getAllCategory();

  @Query('Delete from categories')
  Future<int> deleteAllCategory();

  @Insert(
    "INSERT INTO categories (name,image,description) VALUES (:name,:image,:description)",
  )
  Future<int> createCategory(String name, String image, String description);

  static Future<AppDatabase> openMyDatabase() async {
    return await (AppDatabase.createBuilder().doOnCreate((db, version) async {
      await db.execute("""
        CREATE TABLE `categories` ( `id` INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT, `name` TEXT NOT NULL, `image` TEXT  NULL, `description` TEXT  NULL );
        """);
    }).build());
  }
}
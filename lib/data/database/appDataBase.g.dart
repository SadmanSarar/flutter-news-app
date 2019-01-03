// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'appDataBase.dart';

// **************************************************************************
// TinanoGenerator
// **************************************************************************

DatabaseBuilder<AppDatabase> _$createAppDatabase() {
  return new DatabaseBuilder(new _$AppDatabaseImpl(), "news_app.sqlite", 2);
}

class _$AppDatabaseImpl extends AppDatabase implements GeneratedDatabaseImpl {
  Database database;
  Future<int> getAllCategoryCount() async {
    String sql = "SELECT COUNT(*) FROM categories";

    final bindArgs = [];

    final rows = await database.rawQuery(sql, bindArgs);

    final row = rows.first;
    int parsedRow = row.values.first as int;
    return parsedRow;
  }

  Future<List<Category>> getAllCategory() async {
    String sql = "SELECT * FROM categories";

    final bindArgs = [];

    final rows = await database.rawQuery(sql, bindArgs);

    final parsedResults = new List<Category>();
    rows.forEach((row) {
      Category parsedRow = new Category(row["id"] as int, row["name"] as String,
          row["imageUrl"] as String, row["description"] as String);
      parsedResults.add(parsedRow);
    });
    return parsedResults;
  }

  Future<int> deleteAllCategory() async {
    String sql = "Delete from categories";

    final bindArgs = [];

    final rows = await database.rawQuery(sql, bindArgs);

    final row = rows.length == 0 ? {} : rows.first;
    int parsedRow = row.values.length == 0 ? 0 : row.values.first as int;
    return parsedRow;
  }

  Future<int> createCategory(
      int id, String name, String image, String description) async {
    String sql =
        "INSERT INTO categories (id,name,imageUrl,description) VALUES (?,?,?,?)";

    final bindParams_0 = id;
    final bindParams_1 = name;
    final bindParams_2 = image;
    final bindParams_3 = description;

    final bindArgs = [bindParams_0, bindParams_1, bindParams_2, bindParams_3];

    int lastInsertedRecordId = await database.rawInsert(sql, bindArgs);

    return lastInsertedRecordId;
  }

  Future<int> getAllNewsCount() async {
    String sql = "SELECT COUNT(*) FROM news";

    final bindArgs = [];

    final rows = await database.rawQuery(sql, bindArgs);

    final row = rows.first;
    int parsedRow = row.values.first as int;
    return parsedRow;
  }

  Future<List<News>> getAllNews() async {
    String sql = "SELECT * FROM news";

    final bindArgs = [];

    final rows = await database.rawQuery(sql, bindArgs);

    final parsedResults = new List<News>();
    rows.forEach((row) {
      News parsedRow = new News(
          row["id"] as int,
          row["title"] as String,
          row["body"] as String,
          row["image"] as String,
          row["categoryId"] as int,
          row["type"] as String,
          row["published"] as int,
          row["publishedAt"] as String,
          row["categoryName"] as String);
      parsedResults.add(parsedRow);
    });
    return parsedResults;
  }

  Future<List<News>> getAllNewsByType(String type) async {
    String sql = "SELECT * FROM news where type = ?";

    final bindParams_0 = type;

    final bindArgs = [bindParams_0];

    final rows = await database.rawQuery(sql, bindArgs);

    final parsedResults = new List<News>();
    rows.forEach((row) {
      News parsedRow = new News(
          row["id"] as int,
          row["title"] as String,
          row["body"] as String,
          row["image"] as String,
          row["categoryId"] as int,
          row["type"] as String,
          row["published"] as int,
          row["publishedAt"] as String,
          row["categoryName"] as String);
      parsedResults.add(parsedRow);
    });
    return parsedResults;
  }

  Future<List<News>> getAllNewsForCategory(int categoryId) async {
    String sql = "SELECT * FROM news where categoryId = ?";

    final bindParams_0 = categoryId;

    final bindArgs = [bindParams_0];

    final rows = await database.rawQuery(sql, bindArgs);

    final parsedResults = new List<News>();
    rows.forEach((row) {
      News parsedRow = new News(
          row["id"] as int,
          row["title"] as String,
          row["body"] as String,
          row["image"] as String,
          row["categoryId"] as int,
          row["type"] as String,
          row["published"] as int,
          row["publishedAt"] as String,
          row["categoryName"] as String);
      parsedResults.add(parsedRow);
    });
    return parsedResults;
  }

  Future<List<News>> getAllNewsForCategoryAndType(
      int categoryId, String type) async {
    String sql = "SELECT * FROM news where categoryId = ? and type = ?";

    final bindParams_0 = categoryId;
    final bindParams_1 = type;

    final bindArgs = [bindParams_0, bindParams_1];

    final rows = await database.rawQuery(sql, bindArgs);

    final parsedResults = new List<News>();
    rows.forEach((row) {
      News parsedRow = new News(
          row["id"] as int,
          row["title"] as String,
          row["body"] as String,
          row["image"] as String,
          row["categoryId"] as int,
          row["type"] as String,
          row["published"] as int,
          row["publishedAt"] as String,
          row["categoryName"] as String);
      parsedResults.add(parsedRow);
    });
    return parsedResults;
  }

  Future<List<News>> getFavNews() async {
    String sql = "SELECT * FROM fav_news";

    final bindArgs = [];

    final rows = await database.rawQuery(sql, bindArgs);

    final parsedResults = new List<News>();
    rows.forEach((row) {
      News parsedRow = new News(
          row["id"] as int,
          row["title"] as String,
          row["body"] as String,
          row["image"] as String,
          row["categoryId"] as int,
          row["type"] as String,
          row["published"] as int,
          row["publishedAt"] as String,
          row["categoryName"] as String);
      parsedResults.add(parsedRow);
    });
    return parsedResults;
  }

  Future<News> getFavNewsById(int id) async {
    String sql = "SELECT * FROM fav_news where id = ?";

    final bindParams_0 = id;

    final bindArgs = [bindParams_0];

    final rows = await database.rawQuery(sql, bindArgs);

    final row = rows.first;
    News parsedRow = new News(
        row["id"] as int,
        row["title"] as String,
        row["body"] as String,
        row["image"] as String,
        row["categoryId"] as int,
        row["type"] as String,
        row["published"] as int,
        row["publishedAt"] as String,
        row["categoryName"] as String);
    return parsedRow;
  }

  Future<News> getNewsById(int id) async {
    String sql = "SELECT * FROM news where id = ?";

    final bindParams_0 = id;

    final bindArgs = [bindParams_0];

    final rows = await database.rawQuery(sql, bindArgs);

    final row = rows.length == 0 ? {} : rows.first;
    News parsedRow = new News(
        row["id"] as int,
        row["title"] as String,
        row["body"] as String,
        row["image"] as String,
        row["categoryId"] as int,
        row["type"] as String,
        row["published"] as int,
        row["publishedAt"] as String,
        row["categoryName"] as String);
    return parsedRow;
  }

  Future<int> deleteAllNews() async {
    String sql = "Delete from news";

    final bindArgs = [];

    final rows = await database.rawQuery(sql, bindArgs);

    final row = rows.first;
    int parsedRow = row.values.first as int;
    return parsedRow;
  }

  Future<int> createNews(
      int id,
      String title,
      String body,
      String image,
      int categoryId,
      String type,
      int published,
      String publishedAt,
      String categoryName) async {
    String sql =
        "INSERT INTO news (id,title,body,image,categoryId,type,published,publishedAt,categoryName) VALUES (?,?,?,?,?,?,?,?,?)";

    final bindParams_0 = id;
    final bindParams_1 = title;
    final bindParams_2 = body;
    final bindParams_3 = image;
    final bindParams_4 = categoryId;
    final bindParams_5 = type;
    final bindParams_6 = published;
    final bindParams_7 = publishedAt;
    final bindParams_8 = categoryName;

    final bindArgs = [
      bindParams_0,
      bindParams_1,
      bindParams_2,
      bindParams_3,
      bindParams_4,
      bindParams_5,
      bindParams_6,
      bindParams_7,
      bindParams_8
    ];

    int lastInsertedRecordId = await database.rawInsert(sql, bindArgs);

    return lastInsertedRecordId;
  }

  Future<int> deleteFavNews(int id) async {
    String sql = "Delete from fav_news where id =?";

    final bindParams_0 = id;

    final bindArgs = [bindParams_0];

    final rows = await database.rawQuery(sql, bindArgs);

    final row = rows.first;
    int parsedRow = row.values.first as int;
    return parsedRow;
  }

  Future<int> deleteNews(int id) async {
    String sql = "Delete from news where id =?";

    final bindParams_0 = id;

    final bindArgs = [bindParams_0];

    final rows = await database.rawQuery(sql, bindArgs);

    final row = rows.length == 0 ? {} : rows.first;
    int parsedRow = row.values.length == 0 ? 0 : row.values.first as int;
    return parsedRow;
  }

  Future<int> createFavNews(
      int id,
      String title,
      String body,
      String image,
      int categoryId,
      String type,
      int published,
      String publishedAt,
      String categoryName) async {
    String sql =
        "INSERT INTO fav_news (id,title,body,image,categoryId,type,published,publishedAt,categoryName) VALUES (?,?,?,?,?,?,?,?,?)";

    final bindParams_0 = id;
    final bindParams_1 = title;
    final bindParams_2 = body;
    final bindParams_3 = image;
    final bindParams_4 = categoryId;
    final bindParams_5 = type;
    final bindParams_6 = published;
    final bindParams_7 = publishedAt;
    final bindParams_8 = categoryName;

    final bindArgs = [
      bindParams_0,
      bindParams_1,
      bindParams_2,
      bindParams_3,
      bindParams_4,
      bindParams_5,
      bindParams_6,
      bindParams_7,
      bindParams_8
    ];

    int lastInsertedRecordId = await database.rawInsert(sql, bindArgs);

    return lastInsertedRecordId;
  }
}

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'appDataBase.dart';

// **************************************************************************
// TinanoGenerator
// **************************************************************************

DatabaseBuilder<AppDatabase> _$createAppDatabase() {
  return new DatabaseBuilder(new _$AppDatabaseImpl(), "news_app.sqlite", 1);
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

    final row = rows.first;
    int parsedRow = row.values.first as int;
    return parsedRow;
  }

  Future<int> createCategory(
      String name, String image, String description) async {
    String sql =
        "INSERT INTO categories (name,image,description) VALUES (?,?,?)";

    final bindParams_0 = name;
    final bindParams_1 = image;
    final bindParams_2 = description;

    final bindArgs = [bindParams_0, bindParams_1, bindParams_2];

    int lastInsertedRecordId = await database.rawInsert(sql, bindArgs);

    return lastInsertedRecordId;
  }
}

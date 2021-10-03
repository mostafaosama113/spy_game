import 'package:sqflite/sqflite.dart';

class SqfLite {
  static String dbName = 'location';
  static String tableName = 'locationTable';
  static late Database db;
  static Future<List<Map>> connect() async {
    db = await openDatabase(dbName, version: 1,
        onCreate: (Database db, int version) async {
      await db.execute(
          'CREATE TABLE $tableName (id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, isShow INTEGER)');
      await db.rawInsert(
          'INSERT INTO $tableName(name, isShow) VALUES("مستشفي" , 1)');
      await db.rawInsert(
          'INSERT INTO $tableName(name, isShow) VALUES("مدرسة" , 1)');
      await db.rawInsert(
          'INSERT INTO $tableName(name, isShow) VALUES("حديقة" , 1)');
      await db
          .rawInsert('INSERT INTO $tableName(name, isShow) VALUES("غابة" , 1)');
      await db
          .rawInsert('INSERT INTO $tableName(name, isShow) VALUES("مطار" , 1)');
      await db.rawInsert(
          'INSERT INTO $tableName(name, isShow) VALUES("محل ملابس" , 1)');
      await db
          .rawInsert('INSERT INTO $tableName(name, isShow) VALUES("مطعم" , 1)');
      await db
          .rawInsert('INSERT INTO $tableName(name, isShow) VALUES("ملعب" , 1)');
      await db
          .rawInsert('INSERT INTO $tableName(name, isShow) VALUES("فندق" , 1)');
      await db.rawInsert(
          'INSERT INTO $tableName(name, isShow) VALUES("مقابر" , 1)');
      await db
          .rawInsert('INSERT INTO $tableName(name, isShow) VALUES("مسجد" , 1)');
      await db.rawInsert(
          'INSERT INTO $tableName(name, isShow) VALUES("الجامعة" , 1)');
      await db.rawInsert(
          'INSERT INTO $tableName(name, isShow) VALUES("سوبر ماركت" , 1)');
      await db.rawInsert(
          'INSERT INTO $tableName(name, isShow) VALUES("طائرة" , 1)');
      await db.rawInsert(
          'INSERT INTO $tableName(name, isShow) VALUES("سفينة" , 1)');
    });
    return await db.rawQuery('SELECT * FROM $tableName');
  }

  static Future update(int id, int newValue) async {
    int x = await db
        .rawUpdate('UPDATE $tableName SET isShow = $newValue WHERE id = $id');
    return x;
  }

  static Future delete(int id) async {
    int x = await db.rawUpdate('DELETE FROM  $tableName  WHERE id = $id');
    return x;
  }

  static Future insert(String txt) async {
    await db
        .rawInsert('INSERT INTO $tableName(name, isShow) VALUES("$txt" , 1)');

    List<Map<dynamic, dynamic>> id = await db.rawQuery(
        'SELECT * FROM $tableName WHERE id=(SELECT max(id) FROM $tableName);');
    return id[0]['id'];
  }

  static Future<List<Map>> getVisibleLocations() async {
    //await connect();
    return await db.rawQuery('SELECT * FROM $tableName where isShow = 1');
  }

  static Future<List<Map>> getAllLocations() async {
    return await db.rawQuery('SELECT * FROM $tableName');
  }
}

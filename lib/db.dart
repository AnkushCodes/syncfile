import 'dart:io';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

import 'model.dart';

class DatabaseHelper {
  static final _databaseName = "MyDatabase.db";
  static final _databaseVersion = 1;

  static final table = 'breweries';
  static final vd = 'vd';
  static final id = 'id';
  static final name = 'name';
  static final breweryType = 'breweryType';

  static final street = 'street';
  static final city = 'city';
  static final state = 'state';

  static final postalCode = 'postalCode';
  static final country = 'country';
  static final longitude = 'longitude';

  static final latitude = 'latitude';
  static final phone = 'phone';
  static final websiteUrl = 'websiteUrl';

  static final updatedAt = 'updatedAt';

  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  static Database _database;
  Future<Database> get database async {
    if (_database != null) return _database;
    _database = await _initDatabase();
    print('database created');
    return _database;
  }

  _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, _databaseName);
    return await openDatabase(path,
        version: _databaseVersion, onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
          CREATE TABLE $table(
            $vd INTEGER,
            $id INTEGER,
            $name TEXT NOT NULL,
            $breweryType TEXT NOT NULL,
            $street TEXT NOT NULL,
            $city TEXT NOT NULL,
            $state TEXT NOT NULL,
            $postalCode TEXT NOT NULL,
            $country TEXT NOT NULL,
            $longitude TEXT NOT NULL,
            $latitude TEXT NOT NULL,
            $phone TEXT NOT NULL,
            $websiteUrl TEXT NOT NULL,
            $updatedAt TEXT NOT NULL
          )
          ''');
  }

  Future<int> delete() async {
    Database db = await instance.database;
     await db.delete('$table', where: '$vd = ?', whereArgs: [1]);
   //await db.rawQuery("DELETE FROM $_databaseName WHERE $vd= ?", [1]);
  }

  insert(List<Citybeans> row) async {
    Database db = await instance.database;
    for (Citybeans rdata in row) {
      await db.rawInsert('''INSERT INTO $table(
       $vd,
       $id,
       $name,
       $breweryType,
       $street,
       $city,
       $state,$postalCode,
       $country,$longitude,
       $latitude,$phone,$websiteUrl,$updatedAt) 
    VALUES(?,?, ?, ?,?, ?, ?,?, ?, ?,?, ?, ?,?)''', [
        1,
        rdata.id,
        rdata.name,
        rdata.breweryType,
        rdata.street,
        rdata.city,
        rdata.state,
        rdata.postalCode,
        rdata.country,
        rdata.longitude,
        rdata.longitude,
        rdata.phone,
        rdata.websiteUrl,
        rdata.updatedAt
      ]);
    }
  }

  Future<List<Map<String, dynamic>>> queryAllRows() async {
    Database db = await instance.database;
    return await db.query(table);
  }
}

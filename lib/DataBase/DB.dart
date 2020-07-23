import 'package:flutter_with_sqlite/DataBase/DBTable.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DB {

    String name = "DiaryApp";
    int version = 1;

    Future<Database> open() async {
        String path = join(
            await getDatabasesPath(), name);
        openDatabase(path, 
            version: version,
            onConfigure: onConfigure,
            onCreate: onCreate);
    }
}

onConfigure(Database db) async {
    await db.execute("PRAGMA foreign_keys = ON");
}

onCreate(Database db, int version) async {
    DBTable.TABLES.forEach((script)async => await db.execute(script));
}


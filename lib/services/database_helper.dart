


import 'dart:async';
import 'dart:io';

import 'package:idle_population_clicker/main.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../models/kayitli.dart';
import 'package:flutter/cupertino.dart';

class DatabaseHelper{
  static const databaseName = 'KayitliData.db';
  static const databaseVersion = 1;

  DatabaseHelper();
  static final DatabaseHelper instance = DatabaseHelper();

  Database _database;
  Future<Database> get database async{
    if(_database != null) return _database;
    _database =await initDatabase();
    return _database;
  }
  initDatabase() async{
    Directory dataDirectory =await getApplicationDocumentsDirectory();
    print('dblocation : '+dataDirectory.path);
    String dbPath = join(dataDirectory.path,databaseName);
    return await openDatabase(dbPath,
        version: databaseVersion,onCreate: _onCreateDB);
  }

  _onCreateDB(Database db, int version) async{
    await db.execute('''
    CREATE TABLE ${Kayitli.tblKayitli}(
    ${Kayitli.colId} INTEGER PRIMARY KEY AUTOINCREMENT,
    ${Kayitli.colToplam_nufus} INTEGER,
    ${Kayitli.colSaniyede_gelen_nufus} INTEGER
    )
    ''');
  }


  Future<int> insertKayitli(Kayitli kayitli) async{
    Database db =await database;
    return await db.insert(Kayitli.tblKayitli, kayitli.toMap());
  }

}
class getcount extends StatefulWidget {
  @override
  _getcountState createState() => _getcountState();
}

class _getcountState extends State<getcount> {
  @override
  Widget build(BuildContext context) {
    Future<int> getCount() async {
      Timer timer;
      int start = 3;
      DatabaseHelper dbHelper;
      Kayitli kayitli=Kayitli();
      const oneSec = const Duration(seconds: 1);
      int count2 = await getCount();
      timer = new Timer.periodic(
        oneSec,
            (Timer timer) {
          if (start == 0) {
            kayitli.toplam_nufus=nufus_sayisi;
            if(count2<1) {
              dbHelper.insertKayitli(kayitli);
              print('KONTROL 1');
            } else {

            }

            if (kayitli.toplam_nufus != null) {
              print(count2);
            } else {
              nufus_sayisi=0;
              print(count2);
            }


            setState(() {
              start=3;
            });
          } else {
            setState(() {
              start--;
            });
          }
        },
      );

      //database connection
      Database db = await DatabaseHelper().database;
      var x = await db.rawQuery('SELECT COUNT (*) from ${Kayitli.tblKayitli}');
      int count = Sqflite.firstIntValue(x);
      return count;
    }
    //return Container();
  }
}

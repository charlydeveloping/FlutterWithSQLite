import 'package:flutter_with_sqlite/DataBase/CRUD.dart';
import 'package:flutter_with_sqlite/DataBase/DBTable.dart';

class Diary extends CRUD {

  int id;
  String type;
  String enterCode;
  Diary({this.id, this.type = "", this.enterCode = ""}): super(DBTable.DIARY);

  factory Diary.toObject(Map<dynamic, dynamic> data) {
    return (data!=null)?Diary(
      id:data["id"],
      type:data["type"],
      enterCode:data["enterCode"]
    ): Diary();
  }

  Map<String, dynamic>toMap() {
    return {
      'id': this.id,
      'type': this.type,
      'enterCode': this.enterCode,
    };
  }
  
  getList(parsed) {
    return (parsed as List).map((map) => Diary.toObject(map)).toList();
  }
}
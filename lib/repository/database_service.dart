import 'package:my_flutter_application/repository/my_flutter_db.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseService{
  Database? _database;

  Future<Database> get database async{
    if(_database != null){
      return _database!;
    }
    _database = await initialize();
    return _database!;
  }

  Future<String> get fullPath async{
    const name = 'flutterDB';
    final path = await getDatabasesPath();
    return join(path, name);
  }

  Future<Database> initialize() async{
    final path = await fullPath;
    var database = await openDatabase(
      path,
      version: 1,
      onCreate: create,
      singleInstance: true,
    );
    return database;
  }

  Future<void> create(Database database, int version) async {
    await MyFlutterDB().createTable_users(database);
  }


}

// import 'package:my_flutter_application/repository/database_service.dart';
import 'package:sqflite/sqflite.dart';

class MyFlutterDB{
  final dayOfWeekList = [
      'monday_num',
      'tuesday_num',
      'wednesday_num',
      'thursday_num',
      'friday_num',
      'monday_den',
      'tuesday_den',
      'wednesday_den',
      'thursday_den',
      'friday_den',
  ];

  Future<void> createTable_users(Database database) async {
    await database.execute("""CREATE TABLE users (
      'username' VARCHAR(50) NOT NULL,
      'name' VARCHAR(50),
      'group' VARCHAR(50),
      'surname' VARCHAR(50),
      'password' VARCHAR(60) NOT NULL,
      'logged_in_at' DATETIME NOt NULL,
      PRIMARY KEY('username')
    );
    """);
  }

  Future<void> createTables_groupSchedule(Database database, String group, List schedule) async {

    for (var i = 0; i < dayOfWeekList.length; i++){
      var lst = '';

      var currDayOfWeek = schedule[i];

      currDayOfWeek.forEach((element) {
        lst = '$lst$element VARCHAR(50) NOT NULL,';
      });

      await database.execute("""CREATE TABLE ${group}_${dayOfWeekList[i]} (
        'id' INTEGER NOT NULL,
        $lst
        PRIMARY KEY ('id' AUTOINCREMENT)
      );
      """);
    }
    
    
  }

  // Future<void> createTable_homework(Database database) async {
  //   await database.execute("""CREATE TABLE group_schedule (
  //     'user' VARCHAR(50) NOT NULL,
  //     'monday_num' VARCHAR(50),
  //     'tuesday_num' VARCHAR(50),
  //     'wednesday_num' VARCHAR(50),
  //     'thursday_num' VARCHAR(50),
  //     'friday_num' VARCHAR(50),
  //     'monday_den' VARCHAR(50),
  //     'tuesday_den' VARCHAR(50),
  //     'wednesday_den' VARCHAR(50),
  //     'thursday_den' VARCHAR(50),
  //     'friday_den' VARCHAR(50),
  //     PRIMARY KEY('group')
  //   );
  //   """);
  // }

  // Future<void> createTable_userHomework(Database database) async {
  //   await database.execute("""CREATE TABLE user_homework (
  //     'id' INTEGER NOT NULL,
  //     'username' VARCHAR(50) NOT NULL,
  //     'schedule_table_name' VARCHAR(50),
  //     'schedule_table_row_id' INTEGER,
  //     'homework' VARCHAR(350),
  //     'date' DATETIME,
  //     PRIMARY KEY ('id' AUTOINCREMENT)
  //   );
  //   """);
  // }

  // Future<int> addUser(String username, String password, String name, String surname, String group) async {
  //   final database = await DatabaseService().database;
  //   return await database.rawInsert(
  //     """INSERT INTO users(username, password, name, surname, group, logged_in_at) VALUES(?, ?, ?, ?, ?, ?)""",
  //     [username, password, name, surname, group, DateTime.now()],
  //   );
  // }

  // Future<int> addHomework(String username, int schedule_table_name, int schedule_table_row_id, String homework, DateTime date) async {
  //   final database = await DatabaseService().database;
  //   return await database.rawInsert(
  //     """INSERT INTO homework(username, schedule_table_name, schedule_table_row_id, homework, date) VALUES(?, ?, ?, ?, ?)""",
  //     [username, schedule_table_id, schedule_table_row_id, homework, date],
  //   );
  // }

}

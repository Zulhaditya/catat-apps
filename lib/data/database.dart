import 'package:hive_flutter/hive_flutter.dart';

class TodoDataBase {
  List toDoList = [];

  // reference the box
  final _myBox = Hive.box('mybox');

  // run this method for the first time opening the apps
  void createInitialData() {
    toDoList = [
      ["Cooking", "Make a receipt and cooking", false],
      ["Go to breakfast", "After breakfast go to the gym", false],
    ];
  }

  // load the data
  void loadData() {
    toDoList = _myBox.get("TODOLIST");
  }

  // update the database
  void updateDataBase() {
    _myBox.put("TODOLIST", toDoList);
  }
}

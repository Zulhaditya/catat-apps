import 'package:hive_flutter/hive_flutter.dart';

class TodoDataBase {
  List toDoList = [];

  // reference the box
  final _myBox = Hive.box('mybox');

  // run this method for the first time opening the apps
  void createInitialData() {
    toDoList = [
      ["Cooking a food", false, "Make a receipt and cooking"],
      ["Go to breakfast", false, "After breakfast go to the gym"],
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

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ToDoTile extends StatelessWidget {
  final String taskName;
  final String taskDesc;
  final bool taskCompleted;
  Function(bool?)? onChanged;
  Function(BuildContext)? deleteFunction;
  Function(BuildContext)? updateFunction;

  ToDoTile(
      {super.key,
      required this.taskName,
      required this.taskDesc,
      required this.onChanged,
      required this.deleteFunction,
      required this.updateFunction,
      required this.taskCompleted});

  @override
  Widget build(BuildContext context) {
    return Slidable(
      endActionPane: ActionPane(motion: const StretchMotion(), children: [
        SlidableAction(
          onPressed: updateFunction,
          icon: Icons.edit,
          backgroundColor: Colors.green.shade300,
        ),
        SlidableAction(
          onPressed: deleteFunction,
          icon: Icons.delete,
          backgroundColor: Colors.red.shade300,
        ),
      ]),
      child: CheckboxListTile(
          title: Text(
            taskName,
            style: TextStyle(
              fontSize: 17.0,
              decoration: taskCompleted
                  ? TextDecoration.lineThrough
                  : TextDecoration.none,
            ),
          ),
          subtitle: Text(
            taskDesc,
            style: TextStyle(
              decoration: taskCompleted
                  ? TextDecoration.lineThrough
                  : TextDecoration.none,
            ),
          ),
          value: taskCompleted,
          onChanged: onChanged,
          controlAffinity: ListTileControlAffinity.leading,
          checkboxShape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          activeColor: Colors.black),
    );
  }
}

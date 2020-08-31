import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/models/task_data.dart';

class AddBottomTaskScreen extends StatelessWidget {
  static String newTaskTitle;

  AddBottomTaskScreen();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff757575),
      child: Container(
        padding: EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Add Task',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 35.0,
                fontWeight: FontWeight.w400,
                color: Colors.lightBlueAccent,
              ),
            ),
            TextField(
              textAlign: TextAlign.center,
              autofocus: true,
              onChanged: (newValue) {
                newTaskTitle = newValue;
              },
            ),
            FlatButton(
              child: Text(
                'Add',
              ),
              textColor: Colors.white,
              color: Colors.lightBlueAccent,
              onPressed: () {
                Provider.of<TaskData>(
                  context,
                  listen: false,
                ).addTask(
                    newTaskTitle); // NB. here we use the addTask method in the TaskData to add tasks
                //since it has the much needed notifyListeners method, not the tasks.add method
                Navigator.pop(context);
              },
            )
          ],
        ),
      ),
    );
  }
}

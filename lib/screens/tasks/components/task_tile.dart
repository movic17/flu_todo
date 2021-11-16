import 'package:flutter/material.dart';
import '../../../utils/constants.dart';
import '../../../models/task.dart';
import '../../../services/task_service.dart';

class TaskTile extends StatelessWidget {
  const TaskTile({
    Key? key,
    this.task,
    this.uid,
  }) : super(key: key);
  final Task? task;
  final String? uid;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        task!.content!,
        style: TextStyle(
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.w600,
            color: task!.done! ? kSecondaryText : kPrimaryText,
            fontSize: 18.0,
            decoration: task!.done! ? TextDecoration.lineThrough : null),
      ),
      trailing: Checkbox(
        value: task!.done,
        onChanged: (newValue) {
          TasksService().updateTaskDone(
            uid!,
            task!.id!,
            task!.content!,
            newValue!,
            task!.createdAt!,
          );
        },
      ),
      onLongPress: () => TasksService().deleteTask(uid!, task!.id!),
    );
  }
}

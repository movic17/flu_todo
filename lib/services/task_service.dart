import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flu_todo/controllers/tasks_controller.dart';
import 'package:get/get.dart';
import '../models/task.dart';

class TasksService {
  final _firestore = FirebaseFirestore.instance;

  Stream<List<Task>> getTaskListStream(var uid) {
    return _firestore
        .collection('users')
        .doc(uid)
        .collection('task_list')
        .snapshots()
        .map((snapshot) {
      List<Task> _taskList = [];
      for (var doc in snapshot.docs) {
        _taskList.add(Task.fromDocSnap(doc));
      }
      return _taskList;
    });
  }

  Future<void> addNewTask(String uid, String newTask) async {
    Get.find<TasksController>().isLoading = true;
    try {
      final task = Task(
        content: newTask,
        done: false,
        createdAt: Timestamp.now(),
      );
      await _firestore
          .collection('users')
          .doc(uid)
          .collection('task_list')
          .add(task.toDoc());
      Get.find<TasksController>().isLoading = false;
    } catch (e) {
      Get.find<TasksController>().isLoading = false;
      rethrow;
    }
  }

  Future<void> updateTaskDone(String uid, String id, String taskContent,
      bool newValue, Timestamp createdAt) async {
    try {
      final task = Task(
        content: taskContent,
        done: newValue,
        createdAt: Timestamp.now(),
      );
      await _firestore
          .collection('users')
          .doc(uid)
          .collection('task_list')
          .doc(id)
          .update(task.toDoc());
    } catch (e) {
      rethrow;
    }
  }

  Future<void> deleteTask(String uid, String id) async {
    Get.find<TasksController>().isLoading = true;
    try {
      await _firestore
          .collection('users')
          .doc(uid)
          .collection('task_list')
          .doc(id)
          .delete();
      Get.find<TasksController>().isLoading = false;
    } catch (e) {
      Get.find<TasksController>().isLoading = false;
      rethrow;
    }
  }
}

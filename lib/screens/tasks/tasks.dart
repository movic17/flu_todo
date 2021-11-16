import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:get/get.dart';
import '../../utils/constants.dart';
import '../../controllers/tasks_controller.dart';
import '../../controllers/auth_controller.dart';
import '../../controllers/user_controller.dart';
import '../../components/logo_text.dart';
import 'components/task_tile.dart';
import '../../services/task_service.dart';

class TasksScreen extends GetView<TasksController> {
  TasksScreen({Key? key}) : super(key: key);

  static const String routeName = '/tasks';

  final _task = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: GetX<UserController>(
          init: UserController(),
          builder: (c) {
            if (c.myUser.displayName == null) {
              return const Text(
                'loading ..',
                style: TextStyle(
                    fontSize: 18.0,
                    color: Color(0xFF00FF00),
                    fontWeight: FontWeight.w600),
              );
            }
            return Text(
              'Welcome, ${c.myUser.displayName}',
              style: const TextStyle(
                  color: kOnPrimary,
                  fontWeight: FontWeight.w600,
                  fontSize: 18.0),
            );
          },
        ),
        centerTitle: true,
        backgroundColor: kPrimary,
        actions: [
          IconButton(
            icon: const Icon(Icons.exit_to_app),
            onPressed: () {
              Get.find<AuthController>().signOut();
              Get.find<UserController>().clear();
            },
          ),
        ],
      ),
      body: Container(
        color: kPrimary,
        child: Column(
          children: [
            Column(
              children: [
                const Padding(
                  padding: EdgeInsets.all(20.0),
                  child: LogoText(
                    size: 32.0,
                    color: kOnPrimary,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.list,
                      color: kOnPrimary,
                    ),
                    const SizedBox(width: 20.0),
                    Obx(
                      () => Text(
                        '${controller.taskListCount} task(s)',
                        style: const TextStyle(
                            color: kOnPrimary,
                            fontWeight: FontWeight.w500,
                            fontSize: 16.0),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8.0),
              ],
            ),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  color: kWhite,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20.0),
                      topRight: Radius.circular(20.0)),
                ),
                child: Obx(
                  () => ListView.builder(
                    itemCount: controller.taskListCount,
                    itemBuilder: (_, i) {
                      final task = controller.taskList[i];
                      return TaskTile(
                        uid: Get.find<AuthController>().authUser!.uid,
                        task: task,
                      );
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        mini: true,
        onPressed: () {
          FocusScope.of(context).unfocus();
          Get.bottomSheet(Container(
            color: const Color(0xFF757575),
            child: Container(
              padding:
                  const EdgeInsets.symmetric(vertical: 20.0, horizontal: 16.0),
              decoration: const BoxDecoration(
                color: kWhite,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.0),
                    topRight: Radius.circular(20.0)),
              ),
              child: Column(
                children: [
                  TextField(
                    controller: _task,
                    textAlign: TextAlign.center,
                    decoration: const InputDecoration(
                      hintText: 'Enter your task',
                    ),
                  ),
                  TextButton(
                    child: const Text('Add New Task'),
                    onPressed: () {
                      FocusScope.of(context).unfocus();
                      if (_task.text != '') {
                        TasksService().addNewTask(
                            Get.find<AuthController>().authUser!.uid,
                            _task.text.trim());
                        _task.clear();
                      }
                    },
                    style: TextButton.styleFrom(
                        backgroundColor: kPrimary, primary: kOnPrimary),
                  ),
                ],
              ),
            ),
          ));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

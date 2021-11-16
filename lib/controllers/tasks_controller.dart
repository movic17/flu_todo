import 'package:get/get.dart';
import '../models/task.dart';
import '../services/task_service.dart';
import '../controllers/auth_controller.dart';

class TasksController extends GetxController {
  final _taskList = <Task>[].obs;
  final _isLoading = false.obs;

  @override
  void onInit() async {
    var uid = Get.find<AuthController>().authUser == null
        ? Get.find<AuthController>().authUser
        : Get.find<AuthController>().authUser!.uid;
    _taskList.bindStream(TasksService().getTaskListStream(uid));
    super.onInit();
  }

  set isLoading(bool loading) => _isLoading.value = loading;

  List<Task> get taskList => _taskList;
  int get taskListCount => _taskList.length;
  bool get isLoading=> _isLoading.value;
}

import 'package:f_local_database_sqlite_template/data/models/user_model.dart';
import 'package:f_local_database_sqlite_template/data/repositories/user_repository.dart';
import 'package:get/state_manager.dart';
import 'package:get/get.dart';
import 'package:loggy/loggy.dart';

class UserController extends GetxController {
  var users = <UserModel>[].obs;
  UserRepository repository = Get.find();

  @override
  onInit() {
    super.onInit();
    getAllUsers();
  }

  addUser() async {
    logInfo("userController -> add user");
  }

  Future<void> getAllUsers() async {
    logInfo("userController -> getAllUsers");
  }

  Future<void> deleteUser(id) async {
    logInfo("userController -> delete user $id");
  }
}

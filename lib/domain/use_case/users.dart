import 'package:get/get.dart';
import '../entities/random_user.dart';
import '../repositories/user_repository.dart';

class Users {
  UserRepository repository = Get.find();

  Future<void> addUser() async => await repository.getUser();

  Future<List<RandomUser>> getAllUsers() async =>
      await repository.getAllUsers();

  Future<void> deleteUser(id) async => await repository.deleteUser(id);

  Future<void> deleteAll() async => await repository.deleteAll();

  Future<void> updateUser(user) async => await repository.updateUser(user);
}

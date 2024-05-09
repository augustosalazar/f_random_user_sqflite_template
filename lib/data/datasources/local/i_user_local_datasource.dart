import '../../../domain/entities/random_user.dart';

abstract class IUserLocalDataSource {
  addUser(RandomUser user);
  Future<List<RandomUser>> getAllUsers();
  deleteAll();
  deleteUser(index);
  updateUser(RandomUser user);
}

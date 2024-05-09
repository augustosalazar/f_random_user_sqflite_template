import '../entities/random_user.dart';

abstract class IUserRepository {
  Future<bool> getUser();
  Future<List<RandomUser>> getAllUsers();
  Future<void> deleteUser(id);
  Future<void> deleteAll();
  Future<void> updateUser(user);
}

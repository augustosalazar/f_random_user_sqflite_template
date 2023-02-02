import 'package:loggy/loggy.dart';
import '../../data/datasources/local/user_local_datasource_sqflite.dart';
import '../../data/datasources/remote/user_remote_datasource.dart';
import '../entities/random_user.dart';

class UserRepository {
  late UserRemoteDatatasource remoteDataSource;
  late UserLocalDataSource localDataSource;

  UserRepository() {
    logInfo("Starting UserRepository");
    remoteDataSource = UserRemoteDatatasource();
    localDataSource = UserLocalDataSource();
  }

  // TODO
  // Aquí debemos obtener una instancia de RandomUser del remoteDataSource
  // y pasarla al localDataSource
  Future<bool> getUser() async {
    return Future.value(true);
  }

  Future<List<RandomUser>> getAllUsers() async =>
      await localDataSource.getAllUsers();

  Future<void> deleteUser(id) async => await localDataSource.deleteUser(id);

  Future<void> deleteAll() async => await localDataSource.deleteAll();

  Future<void> updateUser(user) async => await localDataSource.updateUser(user);
}

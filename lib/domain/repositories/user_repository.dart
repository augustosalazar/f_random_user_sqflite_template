import 'package:loggy/loggy.dart';
import '../../data/datasources/local/user_local_datasource_sqflite.dart';
import '../../data/datasources/remote/user_remote_datasource.dart';
import '../entities/random_user.dart';

class UserRepository {
  late UserRemoteDatatasource remoteDataSource;
  late UserLocalDataSource localDataSource;
  //late UserLocalDataSourceHive localDataSource;

  UserRepository() {
    logInfo("Starting UserRepository");
    remoteDataSource = UserRemoteDatatasource();
    localDataSource = UserLocalDataSource();
    //localDataSource = UserLocalDataSourceHive();
  }

  Future<bool> getUser() async {
    RandomUser user = await remoteDataSource.getUser();
    await localDataSource.addUser(user);
    return Future.value(true);
  }

  Future<List<RandomUser>> getAllUsers() async =>
      await localDataSource.getAllUsers();

  Future<void> deleteUser(id) async => await localDataSource.deleteUser(id);

  Future<void> deleteAll() async => await localDataSource.deleteAll();

  Future<void> updateUser(user) async => await localDataSource.updateUser(user);
}

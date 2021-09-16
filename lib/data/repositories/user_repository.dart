import 'package:f_local_database_sqlite/data/datasources/local/hive/user_local_datasource.dart';
import 'package:f_local_database_sqlite/data/datasources/remote/user_remote_datasource.dart';
import 'package:f_local_database_sqlite/data/models/user_model.dart';

class UserRepository {
  late UserRemoteDatatasource remoteDataSource;
  late UserLocalDataSource localDataSource;

  UserRepository() {
    remoteDataSource = UserRemoteDatatasource();
    localDataSource = UserLocalDataSource();
  }

  Future<bool> getUser() async {
    UserModel user = await remoteDataSource.getUser();
    await localDataSource.addUser(user);
    return Future.value(true);
  }

  Future<List<UserModel>> getAllUsers() async =>
      await localDataSource.getAllUsers();

  Future<void> deleteUser(id) async => await localDataSource.deleteUser(id);
}

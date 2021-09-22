import 'package:f_local_database_sqlite_template/data/datasources/local/user_local_datasource.dart';
import 'package:f_local_database_sqlite_template/data/datasources/remote/user_remote_datasource.dart';
import 'package:f_local_database_sqlite_template/data/models/user_model.dart';

class UserRepository {
  late UserRemoteDatatasource remoteDataSource;
  late UserLocalDataSource localDataSource;

  UserRepository() {
    remoteDataSource = UserRemoteDatatasource();
    localDataSource = UserLocalDataSource();
  }

  // Future<bool> getUser() async {

  // }

  // Future<List<UserModel>> getAllUsers() {

  // }

  // Future<void> deleteUser(id) {

  // }
}

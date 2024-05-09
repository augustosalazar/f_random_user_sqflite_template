import '../../../domain/entities/random_user.dart';

abstract class IUserRemoteDataSource {
  Future<RandomUser> getUser();
}

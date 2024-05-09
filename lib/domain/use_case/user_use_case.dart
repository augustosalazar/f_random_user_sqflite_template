import '../entities/random_user.dart';
import '../repositories/user_repository.dart';

class UserUseCase {
  late IUserRepository repository;

  UserUseCase(this.repository);

  Future<void> addUser() async {
    // TODO
    // llamar al metodo de repository para agregar un usuario
  }

  Future<List<RandomUser>> getAllUsers() async {
    // TODO
    // llamar al metodo de repository para obtener todos los usuarios
    return [];
  }

  Future<void> deleteUser(id) async {
    // TODO
    // llamar al metodo de repository para eliminar un usuario
  }

  Future<void> deleteAll() async {
    // TODO
    // llamar al metodo de repository para eliminar todos los usuarios
  }

  Future<void> updateUser(user) async {
    // TODO
    // llamar al metodo de repository para actualizar un usuario
  }
}

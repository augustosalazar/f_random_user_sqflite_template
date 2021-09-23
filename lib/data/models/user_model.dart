import 'package:f_local_database_sqlite_template/data/datasources/remote/user_remote_model.dart';

class UserModel {
  UserModel({
    this.id,
    required this.gender,
    required this.name,
    required this.email,
    required this.picture,
    required this.city,
  });

  final int? id;
  String name;
  final String gender;
  final String email;
  final String picture;
  String city;

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'gender': gender,
      'email': email,
      'picture': picture,
      'city': city
    };
  }

  @override
  String toString() {
    return 'Dog{id: $id, name: $name, age: $gender, email: $email, picture : $picture, city: $city}';
  }

  factory UserModel.fromRemote(UserRemoteModel remoteModel) => UserModel(
        gender: remoteModel.gender,
        name: remoteModel.name.first + " " + remoteModel.name.last,
        city: remoteModel.location.city,
        email: remoteModel.email,
        picture: remoteModel.picture.thumbnail,
      );
}

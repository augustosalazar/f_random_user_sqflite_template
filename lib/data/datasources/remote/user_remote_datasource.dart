import 'package:f_local_database_sqlite_template/data/models/user_model.dart';
import 'package:http/http.dart' as http;

import 'user_remote_model.dart';

class UserRemoteDatatasource {
  Future<UserModel> getUser() async {
    //https://randomuser.me/api/?format=json&results=1

    var request =
        Uri.parse("https://randomuser.me/api").resolveUri(Uri(queryParameters: {
      "format": 'json',
      "results": "1",
    }));

    var response = await http.get(request);
    if (response.statusCode == 200) {
      print("Got code 200");
      var jsonString = response.body;
      UserRemoteModel userRemoteModel =
          randomUserJsonReponseFromJson(jsonString).results[0];
      return UserModel.fromRemote(userRemoteModel);
    } else {
      print("Got error code ${response.statusCode}");
    }

    return Future.error("error");
  }
}

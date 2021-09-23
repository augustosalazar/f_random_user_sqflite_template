import 'package:f_local_database_sqlite_template/data/models/user_model.dart';
import 'package:f_local_database_sqlite_template/domain/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserDetailPage extends StatefulWidget {
  const UserDetailPage({Key? key}) : super(key: key);

  @override
  _UserDetailPageState createState() => _UserDetailPageState();
}

class _UserDetailPageState extends State<UserDetailPage> {
  UserModel user = Get.arguments[0];

  final controllerName = TextEditingController();
  final controllerCity = TextEditingController();

  @override
  Widget build(BuildContext context) {
    UserController userController = Get.find();
    controllerName.text = user.name;
    controllerCity.text = user.city;
    return Scaffold(
      appBar: AppBar(
        title: Text(user.name),
        actions: [
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: () async {
              await userController.deleteUser(user.id);
              Get.back();
            },
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            TextField(
                controller: controllerName,
                decoration: InputDecoration(
                  labelText: 'Name',
                )),
            SizedBox(
              height: 20,
            ),
            TextField(
                key: Key('TextFieldCity'),
                controller: controllerCity,
                decoration: InputDecoration(
                  labelText: 'City',
                )),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Expanded(
                      flex: 2,
                      child: ElevatedButton(
                          onPressed: () async {
                            UserModel userM = user;
                            userM.name = controllerName.text;
                            userM.city = controllerCity.text;
                            await userController.updateUser(userM);
                            Get.back();
                          },
                          child: Text("Save")))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

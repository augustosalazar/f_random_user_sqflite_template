import 'package:f_local_database_sqlite_template/domain/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'pages/user_list_page.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(UserController());
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: UserListPage(),
    );
  }
}

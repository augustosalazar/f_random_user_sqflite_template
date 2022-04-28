import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controllers/user_controller.dart';
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

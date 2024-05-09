import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:f_local_database_sqlite_template/ui/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loggy/loggy.dart';
import 'core/network_info.dart';
import 'data/datasources/local/i_user_local_datasource.dart';
import 'data/datasources/local/user_local_datasource_sqflite.dart';
import 'data/datasources/remote/i_user_remote_datasource.dart';
import 'data/datasources/remote/user_remote_datasource.dart';
import 'data/repositories/user_repository.dart';
import 'domain/repositories/user_repository.dart';
import 'domain/use_case/user_use_case.dart';
import 'ui/home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Loggy.initLoggy(
    logPrinter: const PrettyPrinter(
      showColors: true,
    ),
  );
  Get.put(Connectivity());
  Get.put(NetworkInfo(connectivity: Get.find()));
  Get.put<IUserLocalDataSource>(UserLocalDataSourceSqfLite());
  Get.put<IUserRemoteDataSource>(UserRemoteDatataSource());
  Get.put<IUserRepository>(UserRepository(Get.find(), Get.find()));
  Get.put(UserUseCase(Get.find()));
  Get.put(HomeController());
  runApp(Home());
}

// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:f_local_database_sqlite_template/data/models/user_model.dart';
import 'package:f_local_database_sqlite_template/domain/home_controller.dart';
import 'package:f_local_database_sqlite_template/domain/user_controller.dart';
import 'package:f_local_database_sqlite_template/ui/pages/user_list_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:mockito/mockito.dart';

class MockHomeController extends GetxService
    with Mock
    implements HomeController {
  var _connection = false.obs;
  @override
  Future onInit() {
    super.onInit();
    return Future.value(true);
  }

  @override
  bool get connection => _connection.value;
}

class MockHomeControllerTrue extends GetxService
    with Mock
    implements HomeController {
  var _connection = true.obs;
  @override
  Future onInit() {
    super.onInit();
    return Future.value(true);
  }

  @override
  bool get connection => _connection.value;
}

class MockUserController extends GetxService
    with Mock
    implements UserController {
  var _users = <UserModel>[].obs;

  @override
  List<UserModel> get users => _users;

  @override
  Future onInit() {
    super.onInit();
    return Future.value(true);
  }
}

void main() {
  testWidgets('No connection', (WidgetTester tester) async {
    final MockHomeController _mockHome = MockHomeController();
    Get.put<HomeController>(_mockHome);

    final MockUserController _mockUser = MockUserController();
    Get.put<UserController>(_mockUser);

    // Build our app and trigger a frame.
    WidgetsFlutterBinding.ensureInitialized();

    // Build our app and trigger a frame.
    await tester.pumpWidget(
      MaterialApp(
        home: MaterialApp(
          home: UserListPage(),
        ),
      ),
    );
    await tester.pump();

    expect(find.byKey(Key('addUserButton')), findsOneWidget);

    await tester.tap(find.byKey(Key('addUserButton')));

    await tester.pump();

    await tester.pump();

    expect(find.byIcon(Icons.portable_wifi_off_rounded), findsOneWidget);
  });

  testWidgets('Connection ok', (WidgetTester tester) async {
    final MockHomeControllerTrue _mockHome = MockHomeControllerTrue();
    Get.put<HomeController>(_mockHome);

    final MockUserController _mockUser = MockUserController();
    Get.put<UserController>(_mockUser);

    // Build our app and trigger a frame.
    WidgetsFlutterBinding.ensureInitialized();

    // Build our app and trigger a frame.
    await tester.pumpWidget(
      MaterialApp(
        home: MaterialApp(
          home: UserListPage(),
        ),
      ),
    );
    await tester.pump();

    expect(find.byKey(Key('addUserButton')), findsOneWidget);

    await tester.tap(find.byKey(Key('addUserButton')));

    await tester.pump();

    await tester.pump();

    expect(find.byIcon(Icons.add), findsOneWidget);
  });

  testWidgets('Add one, delete with swipe', (WidgetTester tester) async {
    //add one
    //verify
    //delete wil swipe
  });

  testWidgets('Add one, delete all', (WidgetTester tester) async {
    //add one
    //add one
    //verify
    // delete all
    // verify
  });
}

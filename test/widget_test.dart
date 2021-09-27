// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:f_local_database_sqlite_template/core/network_info.dart';
import 'package:f_local_database_sqlite_template/data/models/user_model.dart';
import 'package:f_local_database_sqlite_template/domain/home_controller.dart';
import 'package:f_local_database_sqlite_template/domain/user_controller.dart';
import 'package:f_local_database_sqlite_template/ui/pages/user_list_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:mockito/mockito.dart';
import 'package:network_image_mock/network_image_mock.dart';

class MockNetworkInfo with Mock implements NetworkInfo {}

class MockHomeController extends GetxService
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
  int cont = 0;
  @override
  List<UserModel> get users => _users;

  @override
  Future onInit() {
    super.onInit();
    return Future.value(true);
  }

  @override
  Future<void> deleteUser(id) {
    print("local deleteUser $id");
    _users.removeAt(id);
    return Future.value();
  }

  @override
  Future<void> deleteAll() {
    _users.clear();
    return Future.value();
  }

  @override
  Future<void> addUser() async {
    print("local addUser");
    if (cont == 0) {
      UserModel user = UserModel(
          id: 0,
          city: 'Barranquilla',
          gender: 'Masculino',
          email: 'reyesjd@mail.com',
          name: 'Jesus Reyes',
          picture: 'https://randomuser.me/api/portraits/thumb/men/75.jpg');
      _users.add(user);
      cont++;
    } else {
      UserModel user = UserModel(
          id: 1,
          city: 'Barranquilla',
          gender: 'Masculino',
          email: 'jhanu@mail.com',
          name: 'Jhan Utria',
          picture: 'https://randomuser.me/api/portraits/thumb/men/75.jpg');
      _users.add(user);
      cont = 0;
    }
  }
}

void main() {
  setUp(() {
    final MockNetworkInfo _mockNetworkInfo = MockNetworkInfo();
    Get.put<NetworkInfo>(_mockNetworkInfo);

    final MockHomeController _mockHome = MockHomeController();
    Get.put<HomeController>(_mockHome);

    final MockUserController _mockUser = MockUserController();
    Get.put<UserController>(_mockUser);
  });

  testWidgets('Connection ok', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    WidgetsFlutterBinding.ensureInitialized();

    // Build our app and trigger a frame.
    await tester.pumpWidget(
      MaterialApp(
        home: UserListPage(),
      ),
    );
    await tester.pump();

    expect(find.byKey(Key('addUserButton')), findsOneWidget);

    expect(find.byIcon(Icons.add), findsOneWidget);
  });

  testWidgets('Add one, delete with swipe', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    WidgetsFlutterBinding.ensureInitialized();

    // Build our app and trigger a frame.
    // https://pub.dev/packages/network_image_mock/example
    await tester.pumpWidget(
      MaterialApp(
        home: mockNetworkImagesFor(() => UserListPage()),
      ),
    );

    await tester.pump();

    expect(find.byKey(Key('addUserButton')), findsOneWidget);

    await tester.tap(find.byKey(Key('addUserButton')));

    await tester.pump();

    expect(find.byType(Dismissible), findsOneWidget);

    await tester.drag(find.byKey(Key('userItem0')), const Offset(500.0, 0.0));

    await tester.pumpAndSettle();

    expect(find.byType(Dismissible), findsNothing);
  });

  testWidgets('Add two, delete one with swipe', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    WidgetsFlutterBinding.ensureInitialized();

    // Build our app and trigger a frame.
    // https://pub.dev/packages/network_image_mock/example
    await tester.pumpWidget(
      MaterialApp(
        home: mockNetworkImagesFor(() => UserListPage()),
      ),
    );

    await tester.pump();

    expect(find.byKey(Key('addUserButton')), findsOneWidget);

    await tester.tap(find.byKey(Key('addUserButton')));

    await tester.pump();

    await tester.tap(find.byKey(Key('addUserButton')));

    await tester.pump();

    expect(find.byType(Dismissible), findsNWidgets(2));

    await tester.drag(find.byKey(Key('userItem0')), const Offset(500.0, 0.0));

    await tester.pumpAndSettle();

    expect(find.byType(Dismissible), findsOneWidget);
  });

  testWidgets('Add one, delete all', (WidgetTester tester) async {
// Build our app and trigger a frame.
    WidgetsFlutterBinding.ensureInitialized();

    // Build our app and trigger a frame.
    // https://pub.dev/packages/network_image_mock/example
    await tester.pumpWidget(
      MaterialApp(
        home: mockNetworkImagesFor(() => UserListPage()),
      ),
    );

    await tester.pump();

    expect(find.byKey(Key('addUserButton')), findsOneWidget);

    await tester.tap(find.byKey(Key('addUserButton')));

    await tester.pump();

    expect(find.byKey(Key('userItem')), findsOneWidget);

    await tester.tap(find.byKey(Key('deleteAllButton')));

    await tester.pumpAndSettle();

    expect(find.byKey(Key('userItem')), findsNothing);
  });
}

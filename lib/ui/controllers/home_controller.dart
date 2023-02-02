import 'package:connectivity/connectivity.dart';
import 'package:get/get.dart';
import 'package:loggy/loggy.dart';

import '../../core/network_info.dart';

class HomeController extends GetxController {
  final connectvityResult = ConnectivityResult.none.obs;
  final NetworkInfo network = Get.find();
  final _connection = false.obs;

  bool get connection => _connection.value;

  @override
  Future onInit() async {
    super.onInit();
    // check for connectivity
    connectvityResult.value = await network.connectivityResult;

    if (connectvityResult.value == ConnectivityResult.none) {
      //localFetch();
      _connection.value = false;
      logInfo("No network");
    } else {
      //remoteFetch();
      _connection.value = true;
      logInfo("Network found");
    }

    // listen to connectivity changed event and update connectvityResult value
    network.onConnectivityChanged.listen((event) {
      connectvityResult.value = event;
      // automatically evoke remote fetch if device is offline
      // and articles data is empty, null or in local view
      if (event != ConnectivityResult.none) {
        logInfo("Connection event");
        _connection.value = true;
      } else {
        logInfo("Disconnect event");
        _connection.value = false;
      }
    });
  }

  @override
  void onClose() {
    // close subscriptions for rx values
    connectvityResult.close();
  }
}

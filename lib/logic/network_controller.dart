import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_flutter_application/main.dart';
import 'package:my_flutter_application/pages/login.dart';

class NetworkController extends GetxController {
  final Connectivity _connectivity = Connectivity();

  @override 
  void onInit() {
    super.onInit();
    _connectivity.onConnectivityChanged.listen(updateConnectionStatus);
  }

  bool checkConnectionStatus(List<ConnectivityResult> connectivityResults) {

    final ConnectivityResult connectivityResult = connectivityResults.isNotEmpty
        ? connectivityResults.first
        : ConnectivityResult.none;

      if (connectivityResult != ConnectivityResult.none) {
        return true;
      } else {
        return false;
      }
  }

  bool updateConnectionStatus(List<ConnectivityResult> connectivityResults) {

    final ConnectivityResult connectivityResult = connectivityResults.isNotEmpty
        ? connectivityResults.first
        : ConnectivityResult.none;

      if (connectivityResult == ConnectivityResult.none) {
        LoginPage.isConnectedToInternet = false;
        MyApp2.isConnected = false;

        Get.rawSnackbar(
          messageText: const Text(
            'PLEASE CONNECT TO THE INTERNET',
            style: TextStyle(
              color: Colors.white,
              fontSize: 14,
            ),
          ),
          isDismissible: false,
          duration: const Duration(days: 1),
          backgroundColor: Colors.red[400]!,
          icon : const Icon(Icons.wifi_off, color: Colors.white, size: 35,),
          snackStyle: SnackStyle.GROUNDED,
          snackPosition: SnackPosition.TOP,
        );

        return true;
      } else {
        LoginPage.isConnectedToInternet = true;
        MyApp2.isConnected = true;

        if (Get.isSnackbarOpen) {
          Get.closeCurrentSnackbar();
        }

        return false;
      }
  }
}

import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:get/get.dart';
import 'package:socket_io_client/socket_io_client.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

import 'package:veritey/api_repository/api_class.dart';
import 'package:veritey/core/constants/constants.dart';
import 'package:veritey/core/constants/helper.dart';
import 'package:veritey/routes/app_pages.dart';

class SplashController extends GetxController {
  void handleNavigation() {
    final loginData = getStorageData.readLoginData();

    if (loginData.data?.location != null) {
      print(getStorageData.readLoginData().data?.location?.address ?? "");
      Get.offNamed(
        Routes.DASHBOARD,
        arguments: {HttpUtil.loginModel: loginData},
      );
    } else {
      Get.offNamed(Routes.LOGIN);
    }
  }

  @override
  void onReady() {
    Future.delayed(const Duration(milliseconds: 1500), () {
      if (getStorageData.readString(getStorageData.tokenKey) != null) {
        if (getStorageData.readBoolean(key: getStorageData.isPinCreated)) {
          // Get.offNamed(Routes.PIN_VERIFICATION);
        } else {
          handleNavigation();
        }
      } else {
        Get.offNamed(Routes.MAINPAGE);
      }
    });
    super.onReady();
  }

  socketRegister() {
    Constants.socket = IO.io(
      Constants.socketBaseUrl,
      <String, dynamic>{
        'transports': ['websocket'],
        'upgraded': ['websocket'],
        'autoConnect': true,
      },
    );

    // TODO : on Connect
    Constants.socket!.onConnect((data) => checkSocket(data, "onConnect"));

    // TODO : on Connecting
    Constants.socket!.onConnecting((data) => checkSocket(data, "onConnecting"));

    // TODO : on ConnectError
    Constants.socket!
        .onConnectError((data) => checkSocket(data, "onConnectError"));

    // TODO : on Connect Timeout
    Constants.socket!
        .onConnectTimeout((data) => checkSocket(data, "onConnectTimeout"));

    // TODO : on Disconnect
    Constants.socket!.onDisconnect((data) => checkSocket(data, "onDisconnect"));
  }

  void checkSocket(data, String identify) {
    if (identify == 'onConnect') {
      printOkStatus(" <<< ---------- Socket $identify ---------- >>>");
    } else {
      printError(" <<< ---------- Socket $identify ---------- >>>");
    }
  }

  @override
  void onInit() {
    getId();
    socketRegister();
    super.onInit();
  }

  Future<String?> getId() async {
    var deviceInfo = DeviceInfoPlugin();
    if (Platform.isIOS) {
      var iosDeviceInfo = await deviceInfo.iosInfo;
      getStorageData.saveString(
          getStorageData.deviceId, iosDeviceInfo.identifierForVendor);
      return iosDeviceInfo.identifierForVendor;
    } else if (Platform.isAndroid) {
      var androidDeviceInfo = await deviceInfo.androidInfo;
      getStorageData.saveString(getStorageData.deviceId, androidDeviceInfo.id);
      return androidDeviceInfo.id;
    }
    return null;
  }
}

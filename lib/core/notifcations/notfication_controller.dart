import 'dart:convert';

import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';

import 'package:veritey/api_repository/api_function.dart';
import 'package:veritey/core/constants/constants.dart';

class NotificationController extends GetxController {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
  late FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin;
  final FirebaseAnalytics _firebaseAnalytics = FirebaseAnalytics.instance;

  @override
  void onInit() {
    super.onInit();
    initialize();
  }

  Future<void> initialize() async {
    _flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

    const initializationSettings = InitializationSettings(
      android: AndroidInitializationSettings('@mipmap/ic_launcher'),
      iOS: DarwinInitializationSettings(),
    );

    await _flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: (NotificationResponse response) {
        _handleNotificationClick(response.payload);
      },
    );

    await _createNotificationChannel();

    NotificationSettings settings = await _firebaseMessaging.requestPermission(
      alert: true,
      badge: true,
      sound: true,
    );

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      String? token = await getDeviceToken();
      if (token != null) {
        try {
          await _firebaseMessaging.subscribeToTopic('all');
        } catch (e) {
          print("Error subscribing to topic: $e");
        }
        await updateDeviceToken(token);
      }
    }

    listenToNotifications();
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  }

  Future<void> _createNotificationChannel() async {
    const AndroidNotificationChannel channel = AndroidNotificationChannel(
      'high_importance_channel',
      'High Importance Notifications',
      description: 'This channel is used for important notifications.',
      importance: Importance.high,
    );

    await _flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);
  }

  Future<String?> getDeviceToken() async {
    try {
      await _firebaseMessaging.requestPermission();
      final String? apnsToken = await _firebaseMessaging.getAPNSToken();

      if (apnsToken == null) {
        print("APNS token is not available.");
        return null;
      }

      final String? token = await _firebaseMessaging.getToken();
      return token;
    } catch (e) {
      print("Error getting device token: $e");
      return null;
    }
  }

  Future<void> subscribeToTopic(String topic) async {
    try {
      await _firebaseMessaging.subscribeToTopic(topic);
    } catch (e) {
      print("Error subscribing to topic: $e");
    }
  }

  Future<void> unsubscribeFromTopic(String topic) async {
    try {
      await _firebaseMessaging.unsubscribeFromTopic(topic);
    } catch (e) {
      print("Error unsubscribing from topic: $e");
    }
  }

  void listenToNotifications() {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      _firebaseAnalytics.logEvent(
        name: 'notification_received',
        parameters: {
          'title': message.notification?.title ?? '',
          'body': message.notification?.body ?? '',
        },
      );

      _handleIncomingNotification(message);
      _showNotification(message);
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      _firebaseAnalytics.logEvent(
        name: 'notification_opened',
        parameters: {
          'title': message.notification?.title ?? '',
          'body': message.notification?.body ?? '',
        },
      );

      _handleIncomingNotification(message);
      _handleNotificationClick(message.data["type"]);
    });
  }

  void _handleIncomingNotification(RemoteMessage message) {
    // _getAllActivityApiCall();

    if (message.data["type"] != "chatting") {
      // _getLatestNotificationApiCall();
    }

    switch (message.data["type"]) {
      case "chatting":
        // _getAllChatApiCall();
        break;
      case "folder-request":
        // _getAllFolderRequestApiCall();
        break;
      case "folder-status-updated":
      case "property-added":
      case "property-delete":
      case "folder-delete":
        _organizeListingsApiCall();
        break;
      case "collab-status-updated":
        // call collab API
        break;
    }
  }

  Future<void> _showNotification(RemoteMessage message) async {
    try {
      const androidDetails = AndroidNotificationDetails(
        'high_importance_channel',
        'High Importance Notifications',
        importance: Importance.max,
        priority: Priority.high,
        playSound: true,
      );

      const iosDetails = DarwinNotificationDetails(
        presentAlert: true,
        presentBadge: true,
        presentSound: true,
      );

      const notificationDetails = NotificationDetails(
        android: androidDetails,
        iOS: iosDetails,
      );

      await _flutterLocalNotificationsPlugin.show(
        0,
        message.notification?.title ?? '',
        message.notification?.body ?? '',
        notificationDetails,
        payload: message.data['type'],
      );
    } catch (e) {
      print("Error showing notification: $e");
    }
  }

  Future<void> updateDeviceToken(String deviceToken) async {
    final json = {
      "fcm_token": deviceToken,
    };

    try {
      final data = await APIFunction().patchApiCall(
        apiName: "users/fcm-token",
        withOutFormData: jsonEncode(json),
      );

      if (data != null && data['success'] == true) {
        print("Device token updated successfully");
      } else {
        utils.showSnackBar(
            message: data['message'] ?? "Failed to update token");
      }
    } catch (e) {
      utils.showSnackBar(message: "Error updating device token");
    }
  }

  Future<void> _handleNotificationClick(String? payload) async {
    switch (payload) {
      case "folder-request":
      case "folder-status-updated":
      case "property-added":
      case "property-delete":
      case "folder-delete":
        _organizeListingsApiCall();
        break;
      case "collab-status-updated":
        // call collab API
        break;
    }

    // _getAllActivityApiCall();

    if (payload != 'chatting') {
      print("No payload data received.");
    }
  }

  void _organizeListingsApiCall() async {
    //call api
  }

  static Future<void> _firebaseMessagingBackgroundHandler(
      RemoteMessage message) async {
    final NotificationController controller = Get.find();
    controller._handleIncomingNotification(message);
    controller._showNotification(message);
  }
}

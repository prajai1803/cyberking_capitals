import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';

class FlutterNotificationService extends GetxService {
  final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

  @override
  void onInit() async {
    await _firebaseMessaging.requestPermission();
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@drawable/ic_notification');
    InitializationSettings initializationSettings =
        const InitializationSettings(
      android: initializationSettingsAndroid,
    );
    await _flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: onDidReceiveNotificationResponse,
    );
    FirebaseMessaging.onMessage.listen(_onMessageListner);
    super.onInit();
  }

  void _onMessageListner(RemoteMessage remoteMessage) {}

  Future<void> backgroundMessageHandler(RemoteMessage message) async {}

  void onDidReceiveNotificationResponse(NotificationResponse details) {}

  showNotification({
    String? title,
    String? body,
  }) async {
    AndroidNotificationDetails androidNotificationDetails =
        const AndroidNotificationDetails(
      '1',
      'channel1',
      channelDescription: '',
      importance: Importance.max,
      priority: Priority.high,
      playSound: true,
      color: Colors.white,
      ticker: 'ticker',
      styleInformation: BigTextStyleInformation(''),
      subText: "Test",
    );
    _flutterLocalNotificationsPlugin.show(10, title ?? "", body ?? "body",
        NotificationDetails(android: androidNotificationDetails));
  }
}

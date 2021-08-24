import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:staycation/utils/CustomScroll.dart';
import 'package:http/http.dart' as http;
import 'package:staycation/utils/url.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  print('Handling a background message ${message.messageId}');
}

const AndroidNotificationChannel channel = AndroidNotificationChannel(
  'high_importance_channel', // id
  'Notifikasi Penting', // title
  'Ini penting!!', // description
  importance: Importance.high,
);

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  if (!kIsWeb) {
    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);
  }

  runApp(Staycation());
}

User? result = FirebaseAuth.instance.currentUser;

class Staycation extends StatefulWidget {
  @override
  StaycationState createState() => StaycationState();
}

Future<String> _base64encodedImage(String url) async {
  String base64Data = '';

  try {
    final http.Response response = await http.get(Uri.parse(url));
    base64Data = base64Encode(response.bodyBytes);
  } catch (e) {
    print(e);
  }
  return base64Data;
}

class StaycationState extends State<Staycation> {
  @override
  void initState() {
    super.initState();

    var initialzationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');
    var initializationSettings =
        InitializationSettings(android: initialzationSettingsAndroid);

    flutterLocalNotificationsPlugin.initialize(initializationSettings);

    FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification!.android;
      if (notification != null && android != null) {
        final String image = await _base64encodedImage(android.imageUrl ?? '');
        final BigPictureStyleInformation bigPictureStyleInformation =
            BigPictureStyleInformation(
                ByteArrayAndroidBitmap.fromBase64String(image),
                largeIcon: ByteArrayAndroidBitmap.fromBase64String(image),
                contentTitle: notification.title,
                htmlFormatContentTitle: true,
                summaryText: notification.body,
                htmlFormatSummaryText: true);
        image != ''
            ? flutterLocalNotificationsPlugin.show(
                notification.hashCode,
                notification.title,
                notification.body,
                NotificationDetails(
                    android: AndroidNotificationDetails(
                  channel.id,
                  channel.name,
                  channel.description,
                  icon: android.smallIcon,
                  largeIcon: ByteArrayAndroidBitmap.fromBase64String(image),
                  styleInformation: bigPictureStyleInformation,
                )))
            : flutterLocalNotificationsPlugin.show(
                notification.hashCode,
                notification.title,
                notification.body,
                NotificationDetails(
                    android: AndroidNotificationDetails(
                  channel.id,
                  channel.name,
                  channel.description,
                  icon: android.smallIcon,
                )));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Color(0xFF3252DF)));
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Staycation',
      initialRoute: result != null ? "/home" : "/",
      routes: Navigate.routes,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Poppins',
      ),
      scrollBehavior: MyCustomScrollBehavior(),
    );
  }
}

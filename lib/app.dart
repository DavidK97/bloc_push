import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class App extends StatefulWidget {
  App({Key? key}) : super(key: key);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  late FlutterLocalNotificationsPlugin localNotificationsPlugin;

  @override
  void initState() {
    super.initState();
    var androidInitialize = new AndroidInitializationSettings('ic_launcher');
    var iOSInitialize = new IOSInitializationSettings();
    var initializationSettings = new InitializationSettings(
        android: androidInitialize, iOS: iOSInitialize);
    localNotificationsPlugin = new FlutterLocalNotificationsPlugin();
    localNotificationsPlugin.initialize(initializationSettings);
  }

  void _showNotification() async {
    var androidDetails = new AndroidNotificationDetails(
        "channelId", "channelName",
        channelDescription: "Test Description", importance: Importance.high);
    var iosDetails = new IOSNotificationDetails();
    var generalNotificationDetails =
        new NotificationDetails(android: androidDetails, iOS: iosDetails);
    await localNotificationsPlugin.show(
        0, "Test Title", "Test Description", generalNotificationDetails);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          body: Center(
            child: Column(
              children: [
                Text("Notification"),
                FloatingActionButton(
                  onPressed: () => _showNotification(),
                  child: Text("Activate"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

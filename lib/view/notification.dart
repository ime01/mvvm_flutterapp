
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class MyNotification extends StatefulWidget {
  const MyNotification({Key? key}) : super(key: key);

  @override
  _NotificationState createState() => _NotificationState();
}

class _NotificationState extends State<MyNotification> {

  //1 create a local notification object
  late FlutterLocalNotificationsPlugin localNotification;

  //2 initialize the object
  @override
  void initState() {
    super.initState();
    //this fucntion is to initialize android settings, it takes an icon name as parameter
    //ensure that icon exist in drawable or it will throw an error
    var androidInitialize = new AndroidInitializationSettings('launch_background');

  //  IOS settings Initialization
    var iOSInitialize = new IOSInitializationSettings();
    var initializationSettings = new InitializationSettings(android: androidInitialize, iOS: iOSInitialize);

  //  Now we instantiate the local notification
    localNotification = new FlutterLocalNotificationsPlugin();
    localNotification.initialize(initializationSettings);

  }

  Future _showNotification() async{

    var androidDetails = new AndroidNotificationDetails(
        "MyChannelId",
        "Local Notification",
        "This is the description of the Notification",
        importance: Importance.high);

    var iosDetails = new IOSNotificationDetails();
    var generalNotificationDetails = new NotificationDetails(android: androidDetails, iOS: iosDetails);

    await localNotification.show(0, "Flutter Notification", "This is a local flutter notification", generalNotificationDetails);

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(title: Text('Notification View'),),

      body: Center(
        child: Text('Click fab button to show notification'),
      ),

      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.notifications),
        onPressed: (){
          _showNotification();
        },
      ),
    );
  }
}

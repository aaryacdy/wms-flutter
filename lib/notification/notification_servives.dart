import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:waste_management_system/notification/firebase_instances.dart';
import 'package:waste_management_system/notification/model/notification_model.dart';

class NotificationServives{

   static final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  requestForNotificationPermission() async{
    final status = await Permission.notification.request();
    if(status.isGranted){
      print('Notification permission granted');
    }else{
      print('Notification permission denied');
    }
  }

   initializeLocalNotification() async {
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');
    const InitializationSettings initializationSettings =
        InitializationSettings(android: initializationSettingsAndroid);

    await flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
   );
  }

saveNotification(NotificationModel notification) async {
    final snap = await FirebaseInstances.firestore
        .collection('notifications')
        .doc(notification.receiverId)
        .get();
    if (snap.exists) {
      await FirebaseInstances.firestore
          .collection('notifications')
          .doc(notification.receiverId)
          .update({
        'notifications': FieldValue.arrayUnion([notification.toJson()]),
      });
      return;
    }
    await FirebaseInstances.firestore
        .collection('notifications')
        .doc(notification.receiverId)
        .set({
      'notifications': [notification.toJson()]
    });
  }

}
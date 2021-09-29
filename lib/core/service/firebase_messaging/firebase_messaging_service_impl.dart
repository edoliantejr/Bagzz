import 'dart:convert';

import 'package:bagzz/core/service/firebase_messaging/firebase_messaging_service.dart';
import 'package:http/http.dart' as http;

class FirebaseMessagingServiceImpl extends FirebaseMessagingService {
  @override
  Future<void> sendTopicNotification(
      {required String toTopic,
      required String title,
      required String message}) async {
    final url = Uri.parse('https://fcm.googleapis.com/fcm/send');
    final serverToken =
        "AAAANe5FCPU:APA91bFK6IcDhag4UwQABUy-s0nO5eQcGYN4jUHKPDdSPeQexFL9-IltIW82Et2bLXh5rxWIbw7H6N3uzuegRwV5IaxCGP-1hUB-EOgw4oT2DjANmwj7qeTMNEttNNZsoY_Xzy8yM6Wi";
    final headers = <String, String>{
      'Content-Type': 'application/json',
      'Authorization': 'Key= $serverToken'
    };

    final response = await http.post(url,
        headers: headers,
        body: jsonEncode(<String, dynamic>{
          'notification': <String, dynamic>{},
          'data': <String, dynamic>{
            'title': title,
            'body': message,
          },
          'to': toTopic
        }));
  }
}

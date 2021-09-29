abstract class FirebaseMessagingService {
  Future<void> sendTopicNotification({
    required int notificationId,
    required String toTopic,
    required String title,
    required String message,
  });
}

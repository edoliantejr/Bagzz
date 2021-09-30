abstract class FirebaseMessagingService {
  Future<void> sendTopicNotification({
    required int notificationId,
    required String toTopic,
    required String bagId,
    required String title,
    required String message,
    required String imageUrl,
    required String route,
  });
}

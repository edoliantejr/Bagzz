abstract class FirebaseMessagingService {
  Future<void> sendTopicNotification({
    required String toTopic,
    required String title,
    required String message,
  });
}

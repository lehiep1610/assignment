enum MessageStatus { none, sent, read }

class ConversationModel {
  final String name;
  final String lastMessage;
  final DateTime time;
  final String avatarAsset;
  final int unreadCount;
  final MessageStatus status;
  const ConversationModel({
    required this.name,
    required this.lastMessage,
    required this.time,
    required this.avatarAsset,
    this.unreadCount = 0,
    this.status = MessageStatus.none,
  });
}

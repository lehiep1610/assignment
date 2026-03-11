import 'package:assignment/app/constants/asset_paths.dart';
import 'package:assignment/features/chat/data/model/conversation_model.dart';

class ChatMockData {
  static final List<ConversationModel> conversations = [
    ConversationModel(
      name: 'Kari Rasmussen',
      lastMessage: 'Thanks for contacting me!',
      time: DateTime.now().subtract(const Duration(hours: 1)),
      avatarAsset: AssetPaths.avatarChat1,
      unreadCount: 2,
    ),
    ConversationModel(
      name: 'Anita Cruz',
      lastMessage: 'Your payment was accepted.',
      time: DateTime.now().subtract(const Duration(hours: 24)),
      avatarAsset: AssetPaths.avatarChat2,
    ),
    ConversationModel(
      name: 'Noah Pierre',
      lastMessage: 'It was great experience!',
      time: DateTime.parse('2021-01-01 15:23:00'),
      avatarAsset: AssetPaths.avatarChat3,
    ),
    ConversationModel(
      name: 'Lucy Bond',
      lastMessage: 'How much does it cost?',
      time: DateTime.parse('2021-01-01 15:23:00'),
      avatarAsset: AssetPaths.avatarChat4,
      status: MessageStatus.read,
    ),
    ConversationModel(
      name: 'Louise Vuitton',
      lastMessage: 'Sure, man!',
      time: DateTime.parse('2021-01-01 15:23:00'),
      avatarAsset: AssetPaths.avatarChat5,
      status: MessageStatus.sent,
    ),
  ];
}

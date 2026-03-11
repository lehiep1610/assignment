import 'package:assignment/app/constants/asset_paths.dart';
import 'package:assignment/app/shared/utils/datetime_formatter.dart';
import 'package:assignment/app/theme/app_colors.dart';
import 'package:assignment/app/theme/app_demensions.dart';
import 'package:assignment/app/theme/app_text_style.dart';
import 'package:assignment/features/chat/data/model/conversation_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ChatListItem extends StatelessWidget {
  final ConversationModel chat;

  const ChatListItem({super.key, required this.chat});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppPaddings.horizontalPage,
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: AvatarRadius.conversationAvatarRadius,
            backgroundColor: AppColors.textFieldBG,
            backgroundImage: AssetImage(chat.avatarAsset),
          ),
          const SizedBox(width: AppSpacing.s12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(chat.name, style: AppTextStyle.body16Semibold),
                const SizedBox(height: AppSpacing.s4),
                Text(
                  chat.lastMessage,
                  style: AppTextStyle.body14Regular.copyWith(
                    color: AppColors.navGray,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          const SizedBox(width: AppSpacing.s8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                formatChatDateTime(chat.time),
                style: AppTextStyle.caption12Medium,
              ),
              const SizedBox(height: AppSpacing.s8),
              _buildStatusIndicator(),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStatusIndicator() {
    if (chat.unreadCount > 0) {
      return Container(
        width: AppIconSize.iconMessageStatusWidth,
        height: AppIconSize.iconMessageStatusWidth,
        decoration: const BoxDecoration(
          gradient: AppColors.primaryButtonLinearGradient,
          shape: BoxShape.circle,
        ),
        alignment: Alignment.center,
        child: Text(
          '${chat.unreadCount}',
          style: AppTextStyle.caption12SemiBold.copyWith(
            color: AppColors.neutralGray0,
          ),
        ),
      );
    }

    if (chat.status == MessageStatus.read) {
      return SvgPicture.asset(
        AssetPaths.messageStatusRead,
        width: AppIconSize.iconMessageStatusWidth,
        height: AppIconSize.iconMessageStatusHeight,
      );
    }

    if (chat.status == MessageStatus.sent) {
      return SvgPicture.asset(
        AssetPaths.messageStatusSent,
        width: AppIconSize.iconMessageStatusWidth,
        height: AppIconSize.iconMessageStatusHeight,
      );
    }

    return const SizedBox.shrink();
  }
}

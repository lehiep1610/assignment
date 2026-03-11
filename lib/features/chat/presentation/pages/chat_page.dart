import 'package:assignment/app/constants/app_strings.dart';
import 'package:assignment/app/constants/asset_paths.dart';
import 'package:assignment/app/shared/widgets/app_textfield.dart';
import 'package:assignment/app/theme/app_colors.dart';
import 'package:assignment/app/theme/app_demensions.dart';
import 'package:assignment/app/theme/app_text_style.dart';
import 'package:assignment/features/chat/data/datasources/chat_mock_data.dart';
import 'package:assignment/features/chat/data/model/conversation_model.dart';
import 'package:assignment/features/chat/presentation/widgets/chat_list_item.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final _searchController = TextEditingController();

  final List<ConversationModel> conversations = ChatMockData.conversations;

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.overlayOnboardingGradientSecond,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: AppPaddings.horizontalPage,
                vertical: AppPaddings.verticalPage,
              ),
              child: AppTextField(
                controller: _searchController,
                gradient: AppColors.primaryButtonLinearGradient,
                prefixIcon: AssetPaths.searchTextFieldIcon,
                prefixIconColor: AppColors.foundationBlueDark,
                hintText: AppStrings.searchMessagesHint,
                hintStyle: AppTextStyle.body16Regular.copyWith(
                  color: AppColors.navGray,
                ),
              ),
            ),
            const SizedBox(height: AppSpacing.s22),
            Expanded(
              child: ListView.separated(
                itemCount: conversations.length,
                separatorBuilder:
                    (_, __) => const SizedBox(height: AppSpacing.s24),
                itemBuilder: (context, index) {
                  return ChatListItem(chat: conversations[index]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

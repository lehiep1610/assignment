import 'package:assignment/app/constants/app_strings.dart';
import 'package:intl/intl.dart';

String formatChatDateTime(DateTime dateTime) {
  final now = DateTime.now();

  final today = DateTime(now.year, now.month, now.day);
  final inputDate = DateTime(dateTime.year, dateTime.month, dateTime.day);

  final difference = today.difference(inputDate).inDays;

  // Today -> return HH:mm
  if (difference == 0) {
    return DateFormat('HH:mm').format(dateTime);
  }

  // Yesterday -> return "Yesterday"
  if (difference == 1) {
    return AppStrings.yesterday;
  }

  // Other days -> return dd/MM/yyyy
  return DateFormat('dd/MM/yyyy').format(dateTime);
}

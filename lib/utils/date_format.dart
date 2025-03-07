import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:test_onr/domain/states/localization_state.dart';
import 'package:test_onr/utils/key_words_constants.dart';

class DatesFormat {
  // final BuildContext context;

  // DatesFormat({required this.context});

  // LocalizationState localization =
  //       Provider.of<LocalizationState>(context, listen: false);

  static String dateToMicroString(DateTime? date, BuildContext context) {
    final LocalizationState localization = Provider.of<LocalizationState>(
      context,
      listen: false,
    );
    return date != null
        ? DateFormat('dd/MM/yyyy').format(date)
        : localization.translate(KeyWordsConstants.datesFormatWithoutDate);
  }

  static String dateToMicroStringWithHour(
    DateTime? date,
    BuildContext context,
  ) {
    final LocalizationState localization = Provider.of<LocalizationState>(
      context,
      listen: false,
    );
    return date != null
        ? DateFormat('dd/MM/yyyy hh:mm').format(date)
        : localization.translate(KeyWordsConstants.datesFormatWithoutDate);
  }

  static String dateToMicroStringWith12HoursFormat(
    DateTime? date,
    BuildContext context,
  ) {
    final LocalizationState localization = Provider.of<LocalizationState>(
      context,
      listen: false,
    );
    String dateFormatted = date != null
        ? DateFormat('dd/MM/yyyy hh:mm a').format(date)
        : localization.translate(
            KeyWordsConstants.datesFormatWithoutDate,
          );
    return dateFormatted;
  }

  static String getMonthAndYear(DateTime date, BuildContext context) {
    final LocalizationState localization = Provider.of<LocalizationState>(
      context,
      listen: false,
    );
    List<String> months = [
      KeyWordsConstants.january,
      KeyWordsConstants.february,
      KeyWordsConstants.march,
      KeyWordsConstants.april,
      KeyWordsConstants.may,
      KeyWordsConstants.june,
      KeyWordsConstants.july,
      KeyWordsConstants.august,
      KeyWordsConstants.september,
      KeyWordsConstants.october,
      KeyWordsConstants.november,
      KeyWordsConstants.december,
    ];

    return "${localization.translate(months[date.month - 1])} ${date.year}";
  }

  static String getDayMonthAndYear(DateTime date, BuildContext context) {
    String monthAndYear = getMonthAndYear(date, context);
    return "${date.day} $monthAndYear";
  }
}

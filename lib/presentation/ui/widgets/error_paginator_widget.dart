import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:provider/provider.dart';
import 'package:test_onr/domain/states/localization_state.dart';
import 'package:test_onr/utils/key_words_constants.dart';

class ErrorPaginatorWidget extends StatelessWidget {
  final PagingController pagingcontroller;

  const ErrorPaginatorWidget({super.key, required this.pagingcontroller});

  @override
  Widget build(BuildContext context) {
    final LocalizationState localization = Provider.of<LocalizationState>(
      context,
    );
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //Big text, medium text, then elevated button with text and icon
          Text(
            localization.translate(KeyWordsConstants.errorPaginatorTitle),
            style: const TextStyle(fontSize: 20),
          ),
          const SizedBox(height: 10),
          Text(
            pagingcontroller.error.toString(),
            style: const TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 20),
          ElevatedButton.icon(
            onPressed: pagingcontroller.refresh,
            icon: const Icon(Icons.refresh),
            label: Text(
              localization.translate(KeyWordsConstants.errorPaginatorRetry),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:provider/provider.dart';
import 'package:test_rappi/domain/states/localization_state.dart';
import 'package:test_rappi/utils/key_words_constants.dart';

class ErrorPaginatorWidget extends StatelessWidget {
  final PagingController pagingController;
  final Function()? onRetry;

  const ErrorPaginatorWidget(
      {super.key, required this.pagingController, this.onRetry});

  @override
  Widget build(BuildContext context) {
    final LocalizationState localization =
        Provider.of<LocalizationState>(context);
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
            pagingController.error.toString(),
            style: const TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 20),
          ElevatedButton.icon(
            onPressed: () {
              pagingController.refresh();
              onRetry?.call();
            },
            icon: const Icon(Icons.refresh),
            label: Text(
                localization.translate(KeyWordsConstants.errorPaginatorRetry)),
          )
        ],
      ),
    );
  }
}

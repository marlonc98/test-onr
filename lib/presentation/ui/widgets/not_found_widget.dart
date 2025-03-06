import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:test_rappi/domain/states/localization_state.dart';
import 'package:test_rappi/utils/images_constants.dart';
import 'package:test_rappi/utils/key_words_constants.dart';
import 'package:provider/provider.dart';

class NotFoundWidget extends StatelessWidget {
  const NotFoundWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final localization = Provider.of<LocalizationState>(context);
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(localization
                .translate(KeyWordsConstants.notFoundWidgetNotResults)),
            SizedBox(height: MediaQuery.of(context).size.height * 0.2),
            TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: Text(localization
                    .translate(KeyWordsConstants.notFoundWidgetGoBack))),
            SizedBox(height: MediaQuery.of(context).size.height * 0.4 - 300),
            Lottie.asset(ImagesConstants.splashLoading, height: 200),
          ],
        ),
      ),
    );
  }
}

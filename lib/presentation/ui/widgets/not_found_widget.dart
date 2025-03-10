import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:test_onr/domain/states/localization_state.dart';
import 'package:test_onr/utils/images_constants.dart';
import 'package:test_onr/utils/key_words_constants.dart';
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
                onPressed: () => context.pop(),
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

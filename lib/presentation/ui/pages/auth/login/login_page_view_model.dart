import 'package:go_router/go_router.dart';
import 'package:test_onr/domain/entities/user/user_entity.dart';
import 'package:test_onr/domain/use_cases/auth/sign_in_use_case.dart';
import 'package:flutter/material.dart';
import 'package:test_onr/domain/entities/exception_entity.dart';
import 'package:either_dart/either.dart';
import 'package:test_onr/presentation/ui/pages/shop/product/list/products_list_page.dart';
import 'package:test_onr/presentation/ui/pages/view_model.dart';
import 'package:test_onr/utils/key_words_constants.dart';
import 'package:test_onr/utils/show_modal.dart';

import 'login_page.dart';

class LoginPageViewModel extends ViewModel<LoginPage> {
  final formKey = GlobalKey<FormState>();
  bool loading = false;
  bool isFingerprintAvailable = false;

  Map<String, dynamic> values = {};
  LoginPageViewModel({
    required super.context,
    required super.widget,
    required super.isMounted,
  });

  void handleLogin() async {
    if (formKey.currentState!.validate()) {
      loading = true;
      notifyListeners();
      Either<ExceptionEntity, UserEntity> response =
          await getIt.get<SignInUseCase>().call(
                email: values[KeyWordsConstants.loginPageEmail],
                password: values[KeyWordsConstants.loginPagePassword],
              );
      if (response.isRight) {
        if (mounted) {
          // ignore: use_build_context_synchronously
          context.go(
            ProductsListPage.route,
          );
        }
      } else {
        loading = false;
        notifyListeners();
        if (mounted) {
          ShowModal.showSnackBar(
            // ignore: use_build_context_synchronously
            context: context,
            text: localization.translate(response.left.code),
            error: true,
          );
        }
      }
    }
  }
}

import 'package:either_dart/either.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:test_onr/domain/entities/exception_entity.dart';
import 'package:test_onr/domain/entities/user/user_entity.dart';
import 'package:test_onr/domain/states/localization_state.dart';
import 'package:test_onr/domain/use_cases/auth/get_current_user_use_case.dart';
import 'package:test_onr/domain/use_cases/default/load_use_case.dart';
import 'package:test_onr/presentation/ui/pages/auth/login/login_page.dart';
import 'package:test_onr/presentation/ui/pages/shop/product/list/products_list_page.dart';
import 'package:test_onr/utils/images_constants.dart';
import 'package:test_onr/utils/key_words_constants.dart';
import 'package:provider/provider.dart';

class SplashPage extends StatefulWidget {
  static const String route = '/';
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    await Future.wait([
      _loadUseCase(),
      _delay(),
      _getCurrentUser(),
    ]);

    if (!mounted) return;

    final Either<ExceptionEntity, UserEntity> response =
        await GetIt.I.get<GetCurrentUserUseCase>().call();
    if (!mounted) return;
    if (response.isRight) {
      context.replace(ProductsListPage.route);
    } else {
      context.replace(LoginPage.route);
    }
  }

  Future<void> _loadUseCase() async {
    await GetIt.I.get<LoadUseCase>().call();
  }

  Future<void> _delay() async {
    await Future.delayed(const Duration(seconds: 2));
  }

  Future<void> _getCurrentUser() async {
    await GetIt.I.get<GetCurrentUserUseCase>().call();
  }

  @override
  Widget build(BuildContext context) {
    final localizationState = Provider.of<LocalizationState>(context);
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              localizationState.translate(KeyWordsConstants.splashPageTitle),
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.5 - 240,
            ),
            Container(
                alignment: Alignment.center,
                child:
                    Lottie.asset(ImagesConstants.splashLoading, height: 200)),
            const SizedBox(
              height: 4,
            ),
            Text(
              localizationState.translate(KeyWordsConstants.splashPageVersion),
            )
          ],
        ),
      ),
    );
  }
}

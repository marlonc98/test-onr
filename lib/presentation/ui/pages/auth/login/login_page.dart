import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_onr/presentation/ui/pages/auth/login/login_page_view_model.dart';
import 'package:test_onr/presentation/ui/widgets/button_widget.dart';
import 'package:test_onr/presentation/ui/widgets/form/form_generator_widget.dart';
import 'package:test_onr/presentation/ui/widgets/form/form_widget.dart';
import 'package:test_onr/utils/key_words_constants.dart';

class LoginPage extends StatefulWidget {
  static const String route = '/login';

  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<LoginPageViewModel>(
      create: (_) => LoginPageViewModel(
        context: context,
        widget: widget,
        isMounted: () => mounted,
      ),
      child: Consumer<LoginPageViewModel>(
        builder: (context, viewModel, child) {
          return Scaffold(
            body: Stack(
              children: [
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  height: MediaQuery.of(context).size.height * 0.4,
                  child: Image.asset(
                    'assets/images/home_banner.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  bottom: MediaQuery.of(context).size.height * 0.6,
                  child: const DecoratedBox(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        colors: [
                          Colors.black54,
                          Colors.transparent,
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: MediaQuery.of(context).size.height * 0.3,
                  left: 8,
                  right: 8,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).scaffoldBackgroundColor,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    padding: const EdgeInsets.all(32.0),
                    child: Form(
                      key: viewModel.formKey,
                      child: FormGeneratorWidget(
                        values: viewModel.values,
                        formWidgets: [
                          Text(
                            viewModel.localization.translate(
                              KeyWordsConstants.loginPageTitle,
                            ),
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                          const SizedBox(height: 16),
                          FormWidget(
                            prefixIcon: Icon(
                              Icons.email_outlined,
                              color:
                                  Theme.of(context).textTheme.bodyMedium?.color,
                            ),
                            text: viewModel.localization.translate(
                              KeyWordsConstants.loginPageEmail,
                            ),
                            keyName: KeyWordsConstants.loginPageEmail,
                            required: true,
                            values: viewModel.values,
                            type: FormType.email,
                          ),
                          FormWidget(
                            prefixIcon: Icon(
                              Icons.lock_outline,
                              color:
                                  Theme.of(context).textTheme.bodyMedium?.color,
                            ),
                            text: viewModel.localization.translate(
                              KeyWordsConstants.loginPagePassword,
                            ),
                            keyName: KeyWordsConstants.loginPagePassword,
                            values: viewModel.values,
                            required: true,
                            type: FormType.password,
                            onFieldSubmitted: (_) => viewModel.handleLogin(),
                          ),
                          const SizedBox(height: 32),
                          ButtonWidget(
                            active: !viewModel.loading,
                            width: MediaQuery.of(context).size.width * .5,
                            onTap: viewModel.handleLogin,
                            text: viewModel.localization.translate(
                              KeyWordsConstants.loginPageLogin,
                            ),
                            type: TypeButton.Main,
                          ),
                        ],
                        onSubmit: viewModel.handleLogin,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:test_onr/domain/states/user_state.dart';
import 'package:test_onr/domain/use_cases/auth/logout_use_case.dart';
import 'package:test_onr/presentation/ui/pages/auth/login/login_page.dart';
import 'package:test_onr/presentation/ui/widgets/button_widget.dart';
import 'package:test_onr/presentation/ui/widgets/custom_bottom_navigation.dart';

class SettingsPage extends StatelessWidget {
  static const String route = '/settings';

  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserState>(context).user;
    final iconColor = Theme.of(context).textTheme.bodyMedium?.color;

    if (user == null) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Settings',
          style: TextStyle(
            color: Theme.of(context).textTheme.bodyMedium?.color,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.person, size: 20, color: iconColor),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            user!.fullname,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(fontSize: 16),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Icon(Icons.email, size: 16, color: iconColor),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            user.email,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(fontSize: 14),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const Spacer(),
            Center(
              child: ButtonWidget(
                onTap: () async {
                  await GetIt.I.get<LogoutUseCase>().call();
                  // ignore: use_build_context_synchronously
                  context.go(
                    LoginPage.route,
                  );
                },
                text: "Logout",
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavigation(
        context: context,
        currentRoute: SettingsPage.route,
      ),
    );
  }
}

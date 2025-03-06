import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:test_onr/di/dependency_injection.dart';
import 'package:test_onr/domain/states/localization_state.dart';
import 'package:test_onr/presentation/routes/route_generator.dart';
import 'package:test_onr/presentation/ui/theme/dark_theme.dart';
import 'package:provider/provider.dart';
import 'dart:async';

FutureOr<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DependencyInjection();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<LocalizationState>(
          create: (_) => GetIt.instance.get<LocalizationState>()),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Onr Shops",
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      darkTheme: darkTheme,
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}

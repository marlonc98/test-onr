import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:test_rappi/di/dependency_injection.dart';
import 'package:test_rappi/domain/states/genders_state.dart';
import 'package:test_rappi/domain/states/localization_state.dart';
import 'package:test_rappi/presentation/routes/route_generator.dart';
import 'package:test_rappi/presentation/ui/theme/dark_theme.dart';
import 'package:provider/provider.dart';
import 'dart:async';

FutureOr<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DependencyInjection();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<LocalizationState>(
          create: (_) => GetIt.instance.get<LocalizationState>()),
      ChangeNotifierProvider<GenrersState>(
          create: (_) => GetIt.instance.get<GenrersState>()),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Rappi Movies",
      debugShowCheckedModeBanner: false,
      theme: darkTheme,
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}

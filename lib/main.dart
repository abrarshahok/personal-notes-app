import 'package:flutter/material.dart';
import '/utils/dependency_injection.dart';
import 'routes/app_router.dart';

void main() {
  setupLocators();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    final appRouter = AppRouter();
    return MaterialApp.router(
      routerConfig: appRouter.config(),
    );
  }
}

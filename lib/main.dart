import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '/data/services/notes_service.dart';
import '/utils/dependency_injection.dart';
import 'routes/app_router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupLocators();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    final appRouter = AppRouter();
    return ChangeNotifierProvider(
      create: (context) => locator<NotesService>(),
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: appRouter.config(),
      ),
    );
  }
}

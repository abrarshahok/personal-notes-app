import 'dart:async';
import 'package:get_it/get_it.dart';
import 'package:streaming_shared_preferences/streaming_shared_preferences.dart';
import '../data/services/notes_service.dart';

final locator = GetIt.instance;

Future<void> setupLocators() async {
  final preferences = await StreamingSharedPreferences.instance;
  locator.registerLazySingleton(() => NotesService(preferences));
}

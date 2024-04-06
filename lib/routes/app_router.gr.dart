// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i3;
import 'package:personal_notes_app/presentation/screens/add_note_screen.dart'
    as _i1;
import 'package:personal_notes_app/presentation/screens/notes_screen.dart'
    as _i2;

abstract class $AppRouter extends _i3.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i3.PageFactory> pagesMap = {
    AddNoteRoute.name: (routeData) {
      return _i3.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.AddNoteScreen(),
      );
    },
    NotesRoute.name: (routeData) {
      return _i3.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.NotesScreen(),
      );
    },
  };
}

/// generated route for
/// [_i1.AddNoteScreen]
class AddNoteRoute extends _i3.PageRouteInfo<void> {
  const AddNoteRoute({List<_i3.PageRouteInfo>? children})
      : super(
          AddNoteRoute.name,
          initialChildren: children,
        );

  static const String name = 'AddNoteRoute';

  static const _i3.PageInfo<void> page = _i3.PageInfo<void>(name);
}

/// generated route for
/// [_i2.NotesScreen]
class NotesRoute extends _i3.PageRouteInfo<void> {
  const NotesRoute({List<_i3.PageRouteInfo>? children})
      : super(
          NotesRoute.name,
          initialChildren: children,
        );

  static const String name = 'NotesRoute';

  static const _i3.PageInfo<void> page = _i3.PageInfo<void>(name);
}

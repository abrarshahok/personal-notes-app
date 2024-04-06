// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i3;
import 'package:flutter/material.dart' as _i4;
import 'package:personal_notes_app/presentation/screens/add_note_screen.dart'
    as _i1;
import 'package:personal_notes_app/presentation/screens/notes_screen.dart'
    as _i2;

abstract class $AppRouter extends _i3.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i3.PageFactory> pagesMap = {
    AddNoteRoute.name: (routeData) {
      final args = routeData.argsAs<AddNoteRouteArgs>(
          orElse: () => const AddNoteRouteArgs());
      return _i3.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i1.AddNoteScreen(
          key: args.key,
          noteId: args.noteId,
        ),
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
class AddNoteRoute extends _i3.PageRouteInfo<AddNoteRouteArgs> {
  AddNoteRoute({
    _i4.Key? key,
    String? noteId,
    List<_i3.PageRouteInfo>? children,
  }) : super(
          AddNoteRoute.name,
          args: AddNoteRouteArgs(
            key: key,
            noteId: noteId,
          ),
          initialChildren: children,
        );

  static const String name = 'AddNoteRoute';

  static const _i3.PageInfo<AddNoteRouteArgs> page =
      _i3.PageInfo<AddNoteRouteArgs>(name);
}

class AddNoteRouteArgs {
  const AddNoteRouteArgs({
    this.key,
    this.noteId,
  });

  final _i4.Key? key;

  final String? noteId;

  @override
  String toString() {
    return 'AddNoteRouteArgs{key: $key, noteId: $noteId}';
  }
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

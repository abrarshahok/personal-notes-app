import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '/constants/app_fonts.dart';
import '/data/services/notes_service.dart';
import '/presentation/widgets/notes_items.dart';
import '/utils/dependency_injection.dart';
import '/components/custom_app_top_bar.dart';
import '/constants/app_colors.dart';
import '/routes/app_router.gr.dart';

@RoutePage()
class NotesScreen extends StatelessWidget {
  const NotesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final notesService = locator<NotesService>();
    return Scaffold(
      appBar: customAppBar(
        title: 'My Notes',
        actionButton: IconButton(
          onPressed: () {
            AutoRouter.of(context).push(AddNoteRoute());
          },
          icon: const Icon(
            Icons.add,
            size: 30,
            color: AppColors.secondaryColor,
          ),
        ),
      ),
      body: Consumer<NotesService>(
        builder: (context, ns, _) {
          final notes = notesService.notes;
          return notes.isEmpty
              ? const Center(
                  child: Text(
                    'No Notes Added Yet!',
                    style: AppFonts.bodyTextBold1,
                  ),
                )
              : ListView.builder(
                  itemCount: notes.length,
                  itemBuilder: (context, index) => NotesItems(
                    note: notes[index],
                    onTapDelete: () =>
                        notesService.removeNoteById(notes[index].id),
                    onTapEdit: () => AutoRouter.of(context).push(
                      AddNoteRoute(noteId: notes[index].id),
                    ),
                  ),
                );
        },
      ),
    );
  }
}

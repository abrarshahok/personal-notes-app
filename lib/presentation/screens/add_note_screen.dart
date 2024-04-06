import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import '/components/custom_text_form_field.dart';
import '/constants/app_colors.dart';
import '/constants/app_fonts.dart';
import '/data/models/note.dart';
import '/components/custom_app_top_bar.dart';
import '/data/services/notes_service.dart';
import '/utils/dependency_injection.dart';

@RoutePage()
class AddNoteScreen extends StatefulWidget {
  const AddNoteScreen({super.key, this.noteId});
  final String? noteId;

  @override
  State<AddNoteScreen> createState() => _AddNoteScreenState();
}

class _AddNoteScreenState extends State<AddNoteScreen> {
  final TextEditingController _noteContentController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final notesService = locator<NotesService>();

  @override
  void initState() {
    if (widget.noteId != null) {
      final note = notesService.getNoteById(widget.noteId!);
      _noteContentController.text = note.content;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
        title: widget.noteId == null ? 'Add Note' : 'Edit Note',
        showLeadingButton: true,
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: CustomTextFormField(
            controller: _noteContentController,
            label: 'Add note here...',
            validator: (content) {
              if (content!.isEmpty) {
                return 'Note cannot be empty';
              }
              return null;
            },
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: AppColors.secondaryColor,
        child: ElevatedButton(
          style:
              ElevatedButton.styleFrom(backgroundColor: AppColors.primaryColor),
          onPressed: _submit,
          child: Text(
            widget.noteId == null ? 'Save Note' : 'Update Note',
            style: AppFonts.bodyTextBold1
                .copyWith(color: AppColors.secondaryColor),
          ),
        ),
      ),
    );
  }

  void _submit() {
    bool isValid = _formKey.currentState!.validate();

    if (!isValid) {
      return;
    }

    final note = Note(
      id: widget.noteId ?? DateTime.now().toString(),
      content: _noteContentController.text.trim(),
    );
    if (widget.noteId != null) {
      notesService.updateNoteById(widget.noteId!, note);
    } else {
      notesService.addNote(note);
    }

    AutoRouter.of(context).maybePop();
  }
}

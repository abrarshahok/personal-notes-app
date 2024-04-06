import 'package:flutter/material.dart';
import '/components/custom_icon_button.dart';
import '/constants/app_colors.dart';
import '/constants/app_fonts.dart';
import '../../data/models/note.dart';

class NotesItems extends StatelessWidget {
  const NotesItems({
    super.key,
    required this.note,
    required this.onTapDelete,
    required this.onTapEdit,
  });
  final Note note;
  final VoidCallback onTapEdit;
  final VoidCallback onTapDelete;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      margin: const EdgeInsets.all(10),
      child: ListTile(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        tileColor: Colors.grey[200],
        title: Row(
          children: [
            SizedBox(
              width: 200,
              child: Text(
                note.content,
                style: AppFonts.bodyText1,
              ),
            ),
            const Spacer(),
            CustomIconButton(
              onTap: onTapEdit,
              icon: Icons.edit,
              iconColor: AppColors.primaryColor,
            ),
            CustomIconButton(
              onTap: onTapDelete,
              icon: Icons.delete,
              iconColor: Colors.red,
            ),
          ],
        ),
      ),
    );
  }
}

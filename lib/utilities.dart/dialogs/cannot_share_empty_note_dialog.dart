import 'package:abolfazlnotes/utilities.dart/dialogs/generics_dialog.dart';
import 'package:flutter/widgets.dart';

Future<void> showCanNotShareEmptyNoteDialog(
  BuildContext context,
) {
  return showGenericDialog<void>(
    context: context,
    title: 'Sharing',
    content: 'You cannot share an empty note!',
    optionsBuilder: () => {
      'OK': null,
    },
  );
}

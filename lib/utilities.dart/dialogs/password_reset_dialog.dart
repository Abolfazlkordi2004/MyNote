import 'package:abolfazlnotes/utilities.dart/dialogs/generics_dialog.dart';
import 'package:flutter/widgets.dart';

Future<void> showPasswordResentDialog(BuildContext context) {
  return showGenericDialog(
    context: context,
    title: 'Password reset',
    content:
        'We have now sent you a password reset link. Please check your email for more information.',
    optionsBuilder: () => {'Ok': Null},
  );
}

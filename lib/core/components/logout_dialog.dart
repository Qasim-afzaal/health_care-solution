import 'package:flutter/cupertino.dart';

import 'package:veritey/core/constants/constants.dart';

class LogoutDialogCupertino extends StatelessWidget {
  const LogoutDialogCupertino({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoAlertDialog(
      title: const Text('Log Out?'),
      content: const Padding(
        padding: EdgeInsets.only(top: 8.0),
        child: Text(
          'You will be signed out of your account and returned to the login screen.',
        ),
      ),
      actions: <CupertinoDialogAction>[
        CupertinoDialogAction(
          onPressed: () => Navigator.pop(context),
          child: const Text('Cancel'),
        ),
        CupertinoDialogAction(
          isDestructiveAction: true,
          onPressed: () async {
            getStorageData.removeAllData();
            Navigator.pop(context);
          },
          child: const Text('Logout'),
        ),
      ],
    );
  }
}

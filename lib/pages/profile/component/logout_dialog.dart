import 'package:flutter/cupertino.dart';

import 'package:veritey/core/constants/app_colors.dart';
import 'package:veritey/core/constants/constants.dart';

class LogoutDialogCupertino extends StatelessWidget {
  const LogoutDialogCupertino({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoAlertDialog(
      title: const Row(
        children: [
          Icon(CupertinoIcons.square_arrow_right_fill,
              color: AppColors.primary, size: 24),
          SizedBox(width: 8),
          Expanded(
            child: Text(
              'Log Out?',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
      content: const Padding(
        padding: EdgeInsets.only(top: 8),
        child: Text(
          'You will be signed out of your account and returned to the login screen.',
          style: TextStyle(
            fontSize: 14,
            color: CupertinoColors.secondaryLabel,
          ),
        ),
      ),
      actions: [
        CupertinoDialogAction(
          onPressed: () => Navigator.pop(context),
          child: const Text(
            'Cancel',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: CupertinoColors.activeBlue,
            ),
          ),
        ),
        CupertinoDialogAction(
          isDestructiveAction: true,
          onPressed: () async {
            getStorageData.removeAllData();
          },
          child: const Text(
            'Logout',
            style: TextStyle(
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }
}

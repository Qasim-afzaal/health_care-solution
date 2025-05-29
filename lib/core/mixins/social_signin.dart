import 'dart:io';

import 'package:veritey/core/components/app_button.dart';
import 'package:veritey/core/components/sb.dart';
import 'package:veritey/core/constants/imports.dart';
import 'package:veritey/gen/assets.gen.dart';

mixin SocialSignIn {
  Widget socialButton(BuildContext context) => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AppButton.borderIcon(
            // onTap: () => loginWithGoogle(),
            icon: Assets.icons.google.svg(),
          ),
          if (Platform.isIOS) ...[
            SB.w(15),
            AppButton.borderIcon(
              // onPressed: _signInWithApple,
              icon: Assets.icons.apple.svg(),
            ),
          ]
        ],
      );
}

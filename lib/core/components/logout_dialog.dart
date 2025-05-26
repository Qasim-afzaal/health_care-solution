import 'package:flutter/material.dart';

class LogoutDialog extends StatelessWidget {
  const LogoutDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final ColorScheme colors = theme.colorScheme;

    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Container(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: colors.primary,
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.exit_to_app_rounded,
                size: 32,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'Log Out?',
              style: theme.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
                color: theme.primaryColor,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'You will be signed out of your account and returned to the login screen.',
              style: theme.textTheme.bodyMedium?.copyWith(
                color: colors.onSurface,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: InkWell(
                    borderRadius: BorderRadius.circular(8.0),
                    onTap: () => Navigator.pop(context),
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        border: Border.all(
                          color: colors.outline,
                        ),
                      ),
                      child: Center(
                        child: Text(
                          'Cancel',
                          style: theme.textTheme.labelLarge?.copyWith(
                            color: colors.onSurfaceVariant,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: InkWell(
                    borderRadius: BorderRadius.circular(8.0),
                    onTap: () async {},
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      decoration: BoxDecoration(
                        color: colors.primary,
                        borderRadius: BorderRadius.circular(8.0),
                        border: Border.all(
                          color: colors.error.withOpacity(0.2),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          'Logout',
                          style: theme.textTheme.labelLarge?.copyWith(
                            color: colors.surface,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

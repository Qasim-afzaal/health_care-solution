import 'package:veritey/core/constants/app_colors.dart';
import 'package:veritey/core/constants/imports.dart';
import 'package:veritey/pages/dashboard/dashboard_controller.dart';

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final bool isDark =
        MediaQuery.of(context).platformBrightness == Brightness.dark;

    return GetBuilder<DashBoardController>(
      builder: (controller) {
        return BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          selectedFontSize: 12,
          unselectedFontSize: 12,
          selectedItemColor:
              isDark ? theme.colorScheme.onSurface : AppColors.primary,
          unselectedItemColor: Colors.grey,
          currentIndex: controller.currentIndex,
          onTap: controller.changeNaveIndex,
          showUnselectedLabels: true,
          selectedLabelStyle: TextStyle(
            color: isDark ? theme.colorScheme.onSurface : AppColors.primary,
          ),
          unselectedLabelStyle: const TextStyle(
            color: Colors.grey,
          ),
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Image.asset(
                'assets/images/Home.png',
                height: 28,
                width: 27,
                color: controller.currentIndex == 0
                    ? (isDark ? theme.colorScheme.onSurface : AppColors.primary)
                    : Colors.grey,
              ),
              activeIcon: Image.asset(
                'assets/images/Home.png',
                height: 28,
                width: 27,
                color: isDark ? theme.colorScheme.onSurface : AppColors.primary,
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                'assets/images/Indicator.png',
                height: 28,
                width: 27,
                color: controller.currentIndex == 1
                    ? (isDark ? theme.colorScheme.onSurface : AppColors.primary)
                    : Colors.grey,
              ),
              activeIcon: Image.asset(
                'assets/images/Indicator.png',
                height: 28,
                width: 27,
                color: isDark ? theme.colorScheme.onSurface : AppColors.primary,
              ),
              label: 'Schedule',
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                'assets/images/health.png',
                height: 80,
                width: 80,
              ),
              activeIcon: Image.asset(
                'assets/images/health.png',
                height: 80,
                width: 80,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                'assets/images/chat.png',
                height: 28,
                width: 27,
                color: controller.currentIndex == 3
                    ? (isDark ? theme.colorScheme.onSurface : AppColors.primary)
                    : Colors.grey,
              ),
              activeIcon: Image.asset(
                'assets/images/chat.png',
                height: 28,
                width: 27,
                color: isDark ? theme.colorScheme.onSurface : AppColors.primary,
              ),
              label: 'Chat',
            ),
            BottomNavigationBarItem(
              icon: const Icon(
                Icons.person_outline,
                size: 28,
                color: Colors.grey,
              ),
              activeIcon: Icon(
                Icons.person,
                size: 28,
                color: isDark ? theme.colorScheme.onSurface : AppColors.primary,
              ),
              label: 'Profile',
            ),
          ],
        );
      },
    );
  }
}

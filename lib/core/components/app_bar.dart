import 'package:veritey/core/constants/imports.dart';
import 'package:veritey/routes/app_pages.dart';

class SimpleAppBar extends StatelessWidget implements PreferredSizeWidget {
  const SimpleAppBar({
    super.key,
    this.title,
    this.backgroundColor,
    this.actions,
    this.onPressed,
  });

  final String? title;
  final Color? backgroundColor;
  final List<Widget>? actions;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor ?? Colors.grey[100],
      elevation: 0,
      title: title != null
          ? Text(
              title!,
              style: context.titleMedium,
            )
          : null,
      centerTitle: true,
      iconTheme: IconThemeData(color: context.primary),
      actions: actions,
      leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Theme.of(context).primaryColor,
          onPressed: onPressed ??
              () => Get.offNamed(
                    Routes.HOME,
                  )),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}

class SparkdAppBar extends StatelessWidget implements PreferredSizeWidget {
  const SparkdAppBar({
    super.key,
    this.title,
    this.backgroundColor,
    this.actions,
  });

  final String? title;
  final Color? backgroundColor;
  final List<Widget>? actions;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor,
      elevation: 0,
      // title:"",
      centerTitle: true,
      iconTheme: IconThemeData(color: context.primary),
      leadingWidth: context.paddingDefault + 32,
      leading: InkWell(
          onTap: () => null,
          child: Assets.icons.settings
              .svg()
              .paddingOnly(left: context.paddingDefault)),
      actions: actions ??
          [
            InkWell(
              onTap: () {},
              child: Assets.icons.accountCircle
                  .svg()
                  .paddingOnly(right: context.paddingDefault),
            ),
          ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}

class SparkdAppBarBeforePayment extends StatelessWidget
    implements PreferredSizeWidget {
  const SparkdAppBarBeforePayment({
    super.key,
    this.title,
    this.backgroundColor,
    this.actions,
  });

  final String? title;
  final Color? backgroundColor;
  final List<Widget>? actions;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor,
      elevation: 0,
      title: title == null
          ? Image.asset(
              "assets/images/Logi.png",
              width: 80,
              height: 80,
            )
          : null,
      centerTitle: true,
      iconTheme: IconThemeData(color: context.primary),
      leadingWidth: context.paddingDefault + 32,
      leading: InkWell(
          onTap: () => null,
          child: Assets.icons.settings
              .svg()
              .paddingOnly(left: context.paddingDefault)),
      actions: actions ??
          [
            InkWell(
              onTap: () => null,
              child: Assets.icons.accountCircle
                  .svg()
                  .paddingOnly(right: context.paddingDefault),
            ),
          ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}

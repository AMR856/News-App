import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/features/home_screen/providers/view_provider.dart';
import 'package:news_app/l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class HomeAppbar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    AppLocalizations appLocalizations = AppLocalizations.of(context)!;
    var viewProvider = Provider.of<ViewProvider>(context);

    return AppBar(
      forceMaterialTransparency: true,
      title: Padding(
        padding: REdgeInsets.symmetric(horizontal: 12.0),
        child: Text(
          viewProvider.title,
          style: Theme.of(context)
              .textTheme
              .headlineMedium!
              .copyWith(fontWeight: FontWeight.w500),
        ),
      ),
      leading: Padding(
        padding: REdgeInsets.symmetric(horizontal: 12.0),
        child: Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
        ),
      ),
      actions: [
        Padding(
          padding: REdgeInsets.symmetric(horizontal: 12.0),
          child: const Icon(Icons.search),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/resources/color_manager.dart';
import 'package:news_app/features/home_screen/widgets/custom_dropdown_menu.dart';
import 'package:news_app/l10n/app_localizations.dart';
import 'package:news_app/providers/language_provider.dart';
import 'package:news_app/providers/theme_provider.dart';
import 'package:provider/provider.dart';

import '../providers/view_provider.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeProvider>(context);
    var langProvider = Provider.of<LanguageProvider>(context);
    var viewProvider = Provider.of<ViewProvider>(context);

    AppLocalizations appLocalizations = AppLocalizations.of(context)!;
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 166.h,
            width: double.infinity,
            color: ColorManager.white,
            child: Center(
              child: Text(
                appLocalizations.news_app,
                style: Theme.of(
                  context,
                ).textTheme.headlineLarge!.copyWith(color: ColorManager.black),
              ),
            ),
          ),
          SizedBox(height: 20.h),
          Padding(
            padding: REdgeInsets.symmetric(horizontal: 18),
            child: Column(
              children: [
                InkWell(
                  child: Row(
                    spacing: 8.w,
                    children: [
                      Icon(Icons.home_outlined, color: ColorManager.white),
                      Text(
                        appLocalizations.go_to_home,
                        style: Theme.of(context).textTheme.headlineMedium!
                            .copyWith(color: ColorManager.white),
                      ),
                    ],
                  ),
                  onTap: () => viewProvider.clearCategory(context),
                ),
                SizedBox(height: 24.h),
                Divider(color: ColorManager.white, thickness: 1.w),
                SizedBox(height: 24.h),
                Row(
                  spacing: 8.w,
                  children: [
                    Icon(
                      Icons.format_paint_outlined,
                      color: ColorManager.white,
                    ),
                    Text(
                      appLocalizations.theme,
                      style: Theme.of(context).textTheme.headlineMedium!
                          .copyWith(color: ColorManager.white),
                    ),
                  ],
                ),
                SizedBox(height: 16.h),
                CustomDropdownMenu(
                  itemsList: [appLocalizations.light, appLocalizations.dark],
                  onChanged: (String? newTheme) {
                    themeProvider.changeTheme(
                      newTheme == appLocalizations.light
                          ? ThemeMode.light
                          : ThemeMode.dark,
                    );
                  },
                  currentValue: themeProvider.currentTheme == ThemeMode.light
                      ? appLocalizations.light
                      : appLocalizations.dark,
                ),
                SizedBox(height: 24.h),
                Divider(color: ColorManager.white, thickness: 1.w),
                SizedBox(height: 24.h),
                Row(
                  spacing: 8.w,
                  children: [
                    Icon(
                      Icons.format_paint_outlined,
                      color: ColorManager.white,
                    ),
                    Text(
                      appLocalizations.language,
                      style: Theme.of(context).textTheme.headlineMedium!
                          .copyWith(color: ColorManager.white),
                    ),
                  ],
                ),
                SizedBox(height: 16.h),
                CustomDropdownMenu(
                  itemsList: ['English', 'عربي'],
                  onChanged: (String? newLang) {
                    langProvider.changeLang(
                      newLang == 'English' ? Locale('en') : Locale('ar'),
                    );
                  },
                  currentValue: langProvider.currentLang == Locale('en')
                      ? 'English'
                      : 'عربي',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

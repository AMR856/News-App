import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/resources/color_manager.dart';
import 'package:news_app/features/home_screen/presentation/cubit/view_cubit.dart';
import 'package:news_app/features/home_screen/presentation/widgets/custom_dropdown_menu.dart';
import 'package:news_app/l10n/app_localizations.dart';
import 'package:news_app/providers/language_provider.dart';
import 'package:news_app/providers/theme_provider.dart';
import 'package:provider/provider.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final langProvider = Provider.of<LanguageProvider>(context);
    final viewCubit = context.read<ViewCubit>();

    final loc = AppLocalizations.of(context)!;

    return Drawer(
      child: Column(
        children: [
          Container(
            height: 166.h,
            width: double.infinity,
            color: ColorManager.white,
            child: Center(
              child: Text(
                loc.news_app,
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
                        loc.go_to_home,
                        style: Theme.of(context).textTheme.headlineMedium!
                            .copyWith(color: ColorManager.white),
                      ),
                    ],
                  ),
                  onTap: () => viewCubit.clearCategory(),
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
                      loc.theme,
                      style: Theme.of(context).textTheme.headlineMedium!
                          .copyWith(color: ColorManager.white),
                    ),
                  ],
                ),

                SizedBox(height: 16.h),

                CustomDropdownMenu(
                  itemsList: [loc.light, loc.dark],
                  onChanged: (String? newTheme) {
                    themeProvider.changeTheme(
                      newTheme == loc.light ? ThemeMode.light : ThemeMode.dark,
                    );
                  },
                  currentValue: themeProvider.currentTheme == ThemeMode.light
                      ? loc.light
                      : loc.dark,
                ),

                SizedBox(height: 24.h),
                Divider(color: ColorManager.white, thickness: 1.w),
                SizedBox(height: 24.h),

                Row(
                  spacing: 8.w,
                  children: [
                    Icon(Icons.language, color: ColorManager.white),
                    Text(
                      loc.language,
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
                      newLang == 'English'
                          ? const Locale('en')
                          : const Locale('ar'),
                    );
                  },
                  currentValue: langProvider.currentLang == const Locale('en')
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

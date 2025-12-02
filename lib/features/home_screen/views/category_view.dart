import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/features/home_screen/models/category_model.dart';
import 'package:news_app/l10n/app_localizations.dart';
import 'package:news_app/providers/theme_provider.dart';
import 'package:provider/provider.dart';
import 'package:news_app/features/home_screen/providers/view_provider.dart';

class CategoryView extends StatelessWidget {
  const CategoryView({super.key});

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeProvider>(context);
    var viewProvider = Provider.of<ViewProvider>(context);

    final bool isDark = themeProvider.currentTheme == ThemeMode.dark;
    final categories = isDark
        ? CategoryModel.getDarkCategories(context)
        : CategoryModel.getLightCategories(context);

    final appLocalizations = AppLocalizations.of(context)!;

    return SafeArea(
      child: Padding(
        padding: REdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              appLocalizations.good_morning,
              style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                fontWeight: FontWeight.w500,
              ),
            ),

            SizedBox(height: 20.h),
            Expanded(
              child: ListView.builder(
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  final category = categories[index];
                  return Container(
                    margin: REdgeInsets.symmetric(vertical: 8),
                    height: 198.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24.r),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(24.r),
                      child: InkWell(
                        onTap: () {
                          viewProvider.setCategory(category.id);
                        },
                        child: Stack(
                          children: [
                            Image.asset(category.photo, fit: BoxFit.cover),
                            Padding(
                              padding: REdgeInsets.symmetric(horizontal: 20),
                              child: Align(
                                alignment: category.isTitleLeft
                                    ? Alignment.centerLeft
                                    : Alignment.centerRight,
                                child: Text(
                                  category.title,
                                  style: Theme.of(context).textTheme.titleLarge,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

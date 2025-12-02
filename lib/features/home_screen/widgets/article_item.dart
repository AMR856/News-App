import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/api/models/article.dart';
import 'package:news_app/core/resources/color_manager.dart';
import 'package:news_app/core/resources/image_manager.dart';
import 'package:news_app/features/home_screen/functions/show_sheet.dart';
import 'package:news_app/l10n/app_localizations.dart';

class ArticleItem extends StatelessWidget {
  Article article;
  ArticleItem({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    final appLocalizations = AppLocalizations.of(context)!;

    return InkWell(
      onTap: () => showSheet(context, article),
      child: Container(
        height: 322.h,
        padding: EdgeInsets.all(8.sp),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.r),
          border: Border.all(
            color: Theme.of(context).brightness == Brightness.dark
                ? ColorManager.white
                : ColorManager.black,
            width: 2.w,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20.r),
              child: Image.network(
                article.urlToImage ?? ImageManager.general,
                width: double.infinity,
                height: 220.h,
                fit: BoxFit.cover,
                errorBuilder: (_, __, ___) => Image.asset(
                  ImageManager.general,
                  height: 220.h,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 10.h),
            Expanded(
              child: Text(
                article.title,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    article.author ?? appLocalizations.unknown,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ),
                Text(
                  _timeAgo(DateTime.parse(article.publishedAt)),
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  String _timeAgo(DateTime date) {
    final now = DateTime.now();
    final diff = now.difference(date);

    if (diff.inSeconds < 60) return "Just now";
    if (diff.inMinutes < 60) return "${diff.inMinutes} minutes ago";
    if (diff.inHours < 24) return "${diff.inHours} hours ago";
    if (diff.inDays < 7) return "${diff.inDays} days ago";

    return "${diff.inDays ~/ 7} weeks ago";
  }

}

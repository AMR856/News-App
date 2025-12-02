import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/api/models/article.dart';
import 'package:news_app/core/resources/color_manager.dart';
import 'package:news_app/l10n/app_localizations.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

void launchArticleUrl(BuildContext context, Article article) async {
  final url = article.url;
  final appLocalizations = AppLocalizations.of(context)!;

  void showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Row(
          children: [
            Icon(Icons.error, color: ColorManager.red),
            SizedBox(width: 10.w),
            Text(
              appLocalizations.error,
              style: Theme.of(
                context,
              ).textTheme.headlineMedium!.copyWith(color: ColorManager.black),
            ),
          ],
        ),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text(
              appLocalizations.ok,
              style: Theme.of(
                context,
              ).textTheme.bodyLarge!.copyWith(color: ColorManager.blue),
            ),
          ),
        ],
      ),
    );
  }

  if (url.isNotEmpty) {
    final uri = Uri.tryParse(url);
    if (uri != null && await canLaunchUrl(uri)) {
      try {
        await launchUrl(uri, mode: LaunchMode.externalApplication);
      } catch (e) {
        showErrorDialog(appLocalizations.open_link);
      }
    } else {
      showErrorDialog(appLocalizations.not_valid_link);
    }
  } else {
    showErrorDialog(appLocalizations.not_available);
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/resources/color_manager.dart';

class CustomDropdownMenu extends StatefulWidget {
  final List<String> itemsList;
  final String currentValue;
  final void Function(String?) onChanged;

  const CustomDropdownMenu({
    super.key,
    required this.itemsList,
    required this.onChanged,
    required this.currentValue,
  });

  @override
  State<CustomDropdownMenu> createState() => _CustomDropdownMenuState();
}

class _CustomDropdownMenuState extends State<CustomDropdownMenu> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: REdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: ColorManager.white, width: 1),
      ),
      width: double.infinity,
      child: Row(
        children: [
          Text(
            widget.currentValue,
            style: Theme.of(
              context,
            ).textTheme.headlineMedium!.copyWith(color: ColorManager.white),
          ),
          Spacer(),
          DropdownButton<String>(
            underline: const SizedBox(),
            items: widget.itemsList
                .map(
                  (item) => DropdownMenuItem(
                    value: item,
                    child: Text(
                      item,
                      style: Theme.of(context).textTheme.headlineMedium!
                          .copyWith(color: ColorManager.black),
                    ),
                  ),
                )
                .toList(),
            onChanged: widget.onChanged,
          ),
        ],
      ),
    );
  }
}

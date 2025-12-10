import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/route_manager/route_manager.dart';
import 'package:news_app/features/home_screen/presentation/cubit/view_cubit.dart';
import 'package:news_app/features/search_screen/cubit/selected_source_cubit.dart';

class HomeAppbar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    final viewCubit = context.watch<ViewCubit>();

    return AppBar(
      forceMaterialTransparency: true,
      title: Padding(
        padding: REdgeInsets.symmetric(horizontal: 12.0),
        child: Text(
          viewCubit.title(context),
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
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
      ),
      actions: [
        Padding(
          padding: REdgeInsets.symmetric(horizontal: 12.0),
          child: IconButton(
            onPressed: () {
              final selectedSourceId =
                  context.read<SelectedSourceCubit>().state;
              print("Current source: $selectedSourceId");

              Navigator.pushNamed(
                context,
                RouteManager.searchScreen,
                arguments: selectedSourceId,
              );
            },
            icon: const Icon(Icons.search),
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

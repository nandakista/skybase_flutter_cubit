import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skybase/core/database/storage/storage_manager.dart';
import 'package:skybase/config/themes/app_colors.dart';
import 'package:skybase/config/themes/app_style.dart';
import 'package:skybase/core/helper/dialog_helper.dart';
import 'package:skybase/data/models/sample_feature/sample_feature.dart';
import 'package:skybase/data/sources/local/cached_key.dart';
import 'package:skybase/config/base/main_navigation.dart';
import 'package:skybase/ui/views/sample_feature/detail/sample_feature_detail_view.dart';
import 'package:skybase/ui/views/sample_feature/list/cubit/sample_feature_list_cubit.dart';
import 'package:skybase/ui/widgets/base/pagination_state_view.dart';
import 'package:skybase/ui/widgets/shimmer/shimmer_list.dart';
import 'package:skybase/ui/widgets/sky_appbar.dart';
import 'package:skybase/ui/widgets/sky_image.dart';

class SampleFeatureListView extends StatelessWidget {
  static const String route = '/user-list';

  const SampleFeatureListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SkyAppBar.secondary(title: 'txt_list_users'.tr()),
      body: BlocBuilder<SampleFeatureListCubit, SampleFeatureListState>(
        builder: (context, state) {
          final cubit = context.read<SampleFeatureListCubit>();
          return PaginationStateView<SampleFeature>.list(
            pagingController: cubit.pagingController,
            loadingView: const ShimmerList(),
            onRefresh: () => cubit.onRefresh(),
            itemBuilder: (BuildContext context, item, int index) {
              return ListTile(
                onTap: () {
                  Navigation.instance.push(
                    context,
                    SampleFeatureDetailView.route,
                    arguments: {
                      'id': item.id,
                      'username': item.username,
                    },
                  );
                },
                leading: SkyImage(
                  shapeImage: ShapeImage.circle,
                  size: 30,
                  src: '${item.avatarUrl}&s=200',
                ),
                title: Text(item.username.toString()),
                subtitle: Text(
                  item.gitUrl.toString(),
                  style: AppStyle.body2,
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.primary,
        onPressed: () async {
          LoadingDialog.show(context);
          await StorageManager.instance.delete(CachedKey.SAMPLE_FEATURE_LIST);
          await StorageManager.instance.delete(CachedKey.SAMPLE_FEATURE_DETAIL);
          if (context.mounted) LoadingDialog.dismiss(context);
        },
        child: const Icon(Icons.delete, color: Colors.white),
      ),
    );
  }
}

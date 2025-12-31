import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skybase/config/base/request_state.dart';
import 'package:skybase/config/themes/app_colors.dart';
import 'package:skybase/core/extension/build_context_extension.dart';
import 'package:skybase/core/mixin/connectivity_mixin.dart';
import 'package:skybase/ui/widgets/base/state_view.dart';
import 'package:skybase/ui/widgets/shimmer/sample_feature/shimmer_sample_feature_list.dart';
import 'package:skybase/ui/widgets/sky_image.dart';

import 'profile_repository_cubit.dart';

class ProfileRepositoryView extends StatefulWidget {
  const ProfileRepositoryView({super.key});

  @override
  State<ProfileRepositoryView> createState() => _ProfileRepositoryViewState();
}

class _ProfileRepositoryViewState extends State<ProfileRepositoryView>
    with ConnectivityMixin {
  @override
  void initState() {
    super.initState();
    listenConnectivity(() {
      context.read<ProfileRepositoryCubit>().getProfileRepositories();
    });
  }

  @override
  void dispose() {
    cancelConnectivity();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileRepositoryCubit, ProfileRepositoryState>(
      builder: (context, state) {
        final cubit = context.read<ProfileRepositoryCubit>();
        return StateView.component(
          loadingEnabled: state.status.isLoading,
          errorEnabled: state.status.isError,
          emptyEnabled: state.status.isEmpty,
          errorTitle: state.error.toString(),
          onRetry: () => cubit.getProfileRepositories(),
          loadingView: const ShimmerSampleFeatureList(),
          child: ListView.builder(
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: state.result?.length,
            itemBuilder: (context, index) {
              final item = state.result?[index];
              return ListTile(
                contentPadding: EdgeInsets.zero,
                leading: SkyImage(
                  shapeImage: ShapeImage.circle,
                  size: 30,
                  src: '${item?.owner.avatarUrl}&s=200',
                  enablePreview: true,
                ),
                title: Text(item?.name ?? '', style: context.typography.body2),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Language: ${item?.language ?? '--'}',
                      style: context.typography.body3,
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            const Icon(Icons.star_border, size: 16),
                            Text(
                              ' ${item?.totalStar ?? 0}',
                              style: context.typography.body3,
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            const Icon(Icons.remove_red_eye_outlined, size: 16),
                            Text(
                              ' ${item?.totalWatch ?? 0}',
                              style: context.typography.body3,
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            SkyImage(
                              src: AppIcons.icFork.path,
                              height: 14,
                              color: Colors.grey,
                            ),
                            Text(
                              ' ${item?.totalFork ?? 0}',
                              style: context.typography.body3,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }
}

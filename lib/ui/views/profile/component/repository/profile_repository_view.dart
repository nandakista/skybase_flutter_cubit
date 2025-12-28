import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skybase/config/themes/app_style.dart';
import 'package:skybase/core/mixin/connectivity_mixin.dart';
import 'package:skybase/ui/widgets/base/state_view.dart';
import 'package:skybase/ui/widgets/shimmer/sample_feature/shimmer_sample_feature_list.dart';
import 'package:skybase/ui/widgets/sky_image.dart';

import 'cubit/profile_repository_cubit.dart';

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
        final data = (state is ProfileRepositoryLoaded) ? state.result : null;
        final errMessage =
            (state is ProfileRepositoryError) ? state.message : null;

        return StateView.component(
          loadingEnabled: state is ProfileRepositoryLoading,
          errorEnabled: state is ProfileRepositoryError,
          emptyEnabled: state is ProfileRepositoryInitial,
          errorTitle: errMessage,
          onRetry: () => cubit.getProfileRepositories(),
          loadingView: const ShimmerSampleFeatureList(),
          child: ListView.builder(
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: data?.length,
            itemBuilder: (context, index) {
              final item = data?[index];
              return ListTile(
                contentPadding: EdgeInsets.zero,
                leading: SkyImage(
                  shapeImage: ShapeImage.circle,
                  size: 30,
                  src: '${item?.owner.avatarUrl}&s=200',
                  enablePreview: true,
                ),
                title: Text(item?.name ?? '', style: AppStyle.body2),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Language: ${item?.language ?? '--'}',
                      style: AppStyle.body3,
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
                              style: AppStyle.body3,
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            const Icon(Icons.remove_red_eye_outlined, size: 16),
                            Text(
                              ' ${item?.totalWatch ?? 0}',
                              style: AppStyle.body3,
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            const SkyImage(
                              src: 'assets/images/ic_fork.svg',
                              height: 14,
                              color: Colors.grey,
                            ),
                            Text(
                              ' ${item?.totalFork ?? 0}',
                              style: AppStyle.body3,
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

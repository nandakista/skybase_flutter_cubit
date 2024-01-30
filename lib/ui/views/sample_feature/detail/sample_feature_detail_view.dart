import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skybase/ui/views/sample_feature/detail/cubit/sample_feature_detail_cubit.dart';
import 'package:skybase/ui/views/sample_feature/detail/widgets/sample_feature_detail_header.dart';
import 'package:skybase/ui/views/sample_feature/detail/widgets/sample_feature_detail_info.dart';
import 'package:skybase/ui/views/sample_feature/detail/widgets/sample_feature_detail_tab.dart';
import 'package:skybase/ui/widgets/base/state_view.dart';
import 'package:skybase/ui/widgets/shimmer/shimmer_detail.dart';
import 'package:skybase/ui/widgets/sky_appbar.dart';

class SampleFeatureDetailView extends StatelessWidget {
  static const String route = '/user-detail';

  const SampleFeatureDetailView({super.key, required this.usernameArgs});

  final String usernameArgs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SkyAppBar.primary(title: usernameArgs),
      body: SafeArea(
        child: BlocBuilder<SampleFeatureDetailCubit, SampleFeatureDetailState>(
          builder: (context, state) {
            final cubit = context.read<SampleFeatureDetailCubit>();
            final data =
                (state is SampleFeatureDetailLoaded) ? state.result : null;
            final errMessage =
                (state is SampleFeatureDetailError) ? state.message : null;

            return StateView.page(
              loadingEnabled: state is SampleFeatureDetailLoading,
              errorEnabled: state is SampleFeatureDetailError,
              emptyEnabled: false,
              loadingView: const ShimmerDetail(),
              errorTitle: errMessage,
              onRefresh: () => cubit.onRefresh(context),
              onRetry: () => cubit.onRefresh(context),
              child: Column(
                children: [
                  SampleFeatureDetailHeader(
                    avatar: data?.avatarUrl ?? '',
                    repositoryCount: data?.repository ?? 0,
                    followerCount: data?.followers ?? 0,
                    followingCount: data?.following ?? 0,
                  ),
                  SampleFeatureDetailInfo(
                    name: data?.name ?? '',
                    bio: data?.bio ?? '',
                    company: data?.company ?? '',
                    location: data?.location ?? '',
                  ),
                  SampleFeatureDetailTab(data: data),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skybase/core/mixin/connectivity_mixin.dart';
import 'package:skybase/ui/views/sample_feature/detail/widgets/sample_feature_detail_header.dart';
import 'package:skybase/ui/views/sample_feature/detail/widgets/sample_feature_detail_info.dart';
import 'package:skybase/ui/views/sample_feature/detail/widgets/sample_feature_detail_tab.dart';
import 'package:skybase/ui/widgets/base/state_view.dart';
import 'package:skybase/ui/widgets/shimmer/sample_feature/shimmer_sample_feature_detail.dart';
import 'package:skybase/ui/widgets/sky_appbar.dart';

import 'cubit/sample_feature_detail_cubit.dart';

class SampleFeatureDetailView extends StatefulWidget {
  static const String route = '/user-detail';

  const SampleFeatureDetailView({
    super.key,
    required this.usernameArgs,
    required this.userIdArgs,
  });

  final int userIdArgs;
  final String usernameArgs;

  @override
  State<SampleFeatureDetailView> createState() =>
      _SampleFeatureDetailViewState();
}

class _SampleFeatureDetailViewState extends State<SampleFeatureDetailView>
    with ConnectivityMixin {
  @override
  void initState() {
    super.initState();
    listenConnectivity(() {
      context.read<SampleFeatureDetailCubit>().getUserDetail(
        userId: widget.userIdArgs,
        userName: widget.usernameArgs,
      );
    });
  }

  @override
  void dispose() {
    cancelConnectivity();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SkyAppBar.primary(title: widget.usernameArgs),
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
              loadingView: const ShimmerSampleFeatureDetail(),
              errorTitle: errMessage,
              onRefresh:
                  () => cubit.getUserDetail(
                    userId: widget.userIdArgs,
                    userName: widget.usernameArgs,
                  ),
              onRetry:
                  () => cubit.getUserDetail(
                    userId: widget.userIdArgs,
                    userName: widget.usernameArgs,
                  ),
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

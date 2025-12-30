import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skybase/config/base/request_state.dart';
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
        invalidateCache: true,
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
            return StateView.page(
              loadingEnabled: state.status.isLoading,
              errorEnabled: state.status.isError,
              emptyEnabled: state.status.isEmpty,
              loadingView: const ShimmerSampleFeatureDetail(),
              errorTitle: state.error.toString(),
              onRefresh:
                  () => cubit.getUserDetail(
                    userId: widget.userIdArgs,
                    userName: widget.usernameArgs,
                    invalidateCache: true,
                  ),
              onRetry:
                  () => cubit.getUserDetail(
                    userId: widget.userIdArgs,
                    userName: widget.usernameArgs,
                    invalidateCache: true,
                  ),
              child: Column(
                children: [
                  SampleFeatureDetailHeader(
                    avatar: state.result?.avatarUrl ?? '',
                    repositoryCount: state.result?.repository ?? 0,
                    followerCount: state.result?.followers ?? 0,
                    followingCount: state.result?.following ?? 0,
                  ),
                  SampleFeatureDetailInfo(
                    name: state.result?.name ?? '',
                    bio: state.result?.bio ?? '',
                    company: state.result?.company ?? '',
                    location: state.result?.location ?? '',
                  ),
                  SampleFeatureDetailTab(data: state.result),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skybase/config/base/request_state.dart';
import 'package:skybase/core/extension/context_extension.dart';
import 'package:skybase/core/mixin/connectivity_mixin.dart';
import 'package:skybase/ui/routes/navigator/app_navigator.dart';
import 'package:skybase/ui/views/settings/setting_view.dart';
import 'package:skybase/ui/widgets/base/state_view.dart';
import 'package:skybase/ui/widgets/sky_image.dart';

import 'component/repository/profile_repository_view.dart';
import 'cubit/profile_cubit.dart';

class ProfileView extends StatefulWidget {
  static const String route = '/profile';

  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> with ConnectivityMixin {
  @override
  void initState() {
    super.initState();
    listenConnectivity(() {
      context.read<ProfileCubit>().getProfile();
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
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () => navigator.push(SettingView.route),
            icon: Icon(
              CupertinoIcons.settings,
              color: Theme.of(context).iconTheme.color,
            ),
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: BlocBuilder<ProfileCubit, ProfileState>(
        builder: (context, state) {
          final cubit = context.read<ProfileCubit>();
          return StateView.page(
            loadingEnabled: state.status.isLoading,
            errorEnabled: state.status.isError,
            emptyEnabled: state.status.isEmpty,
            errorTitle: state.error.toString(),
            onRetry: () => cubit.getProfile(),
            onRefresh: () => cubit.getProfile(),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: [
                  SkyImage(
                    shapeImage: ShapeImage.circle,
                    size: 40,
                    src: '${state.result?.avatarUrl}&s=200',
                  ),
                  const SizedBox(height: 12),
                  Text(
                    state.result?.name ?? '--',
                    style: context.typography.headline3,
                  ),
                  Text(state.result?.bio ?? '--'),
                  const SizedBox(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Text(
                            '${state.result?.repository ?? 0}',
                            style: context.typography.headline3,
                          ),
                          const Text('Repository'),
                        ],
                      ),
                      Column(
                        children: [
                          Text(
                            '${state.result?.followers ?? 0}',
                            style: context.typography.headline3,
                          ),
                          const Text('Follower'),
                        ],
                      ),
                      Column(
                        children: [
                          Text(
                            '${state.result?.following ?? 0}',
                            style: context.typography.headline3,
                          ),
                          const Text('Following'),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  Row(
                    children: [
                      const Icon(Icons.location_city),
                      Text(' ${state.result?.company ?? '--'}'),
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(Icons.location_on),
                      Text(' ${state.result?.location ?? '--'}'),
                    ],
                  ),
                  const SizedBox(height: 8),
                  const Divider(color: Colors.black38),
                  Row(
                    children: [
                      Text(
                        'Repository List',
                        style: context.typography.headline3,
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  const ProfileRepositoryView(),
                  const SizedBox(height: 12),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

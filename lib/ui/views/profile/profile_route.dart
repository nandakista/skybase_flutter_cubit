import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:skybase/service_locator.dart';
import 'package:skybase/ui/views/profile/profile_view.dart';

import 'component/repository/profile_repository_cubit.dart';
import 'profile_cubit.dart';

final profileRoute = [
  GoRoute(
    path: ProfileView.route,
    name: ProfileView.route,
    builder: (context, state) {
      return MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => sl<ProfileCubit>()..getProfile()),
          BlocProvider(
            create:
                (_) => sl<ProfileRepositoryCubit>()..getProfileRepositories(),
          ),
        ],
        child: const ProfileView(),
      );
    },
  ),
];

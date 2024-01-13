import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:skybase/service_locator.dart';
import 'package:skybase/ui/views/profile/cubit/profile_cubit.dart';
import 'package:skybase/ui/views/profile/component/repository/cubit/profile_repository_cubit.dart';
import 'package:skybase/ui/views/profile/profile_view.dart';

final profileRoute = [
  GoRoute(
    path: ProfileView.route,
    name: ProfileView.route,
    builder: (context, state) {
      return MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => sl<ProfileCubit>()),
          BlocProvider(create: (_) => sl<ProfileRepositoryCubit>()),
        ],
        child: const ProfileView(),
      );
    },
  ),
];

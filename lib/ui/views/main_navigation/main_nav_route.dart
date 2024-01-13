import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:skybase/service_locator.dart';
import 'package:skybase/ui/views/main_navigation/main_nav_view.dart';
import 'package:skybase/ui/views/profile/cubit/profile_cubit.dart';
import 'package:skybase/ui/views/profile/component/repository/cubit/profile_repository_cubit.dart';
import 'package:skybase/ui/views/sample_feature/list/cubit/sample_feature_list_cubit.dart';

final mainNavRoute = [
  GoRoute(
    path: MainNavView.route,
    name: MainNavView.route,
    builder: (context, state) => MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => sl<SampleFeatureListCubit>()),
        BlocProvider(create: (_) => sl<ProfileCubit>()),
        BlocProvider(create: (_) => sl<ProfileRepositoryCubit>()),
      ],
      child: const MainNavView(),
    ),
  ),
];

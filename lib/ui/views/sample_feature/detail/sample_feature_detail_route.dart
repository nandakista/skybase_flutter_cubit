import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:skybase/service_locator.dart';
import 'package:skybase/ui/views/sample_feature/detail/sample_feature_detail_view.dart';

import 'cubit/sample_feature_detail_cubit.dart';

final sampleFeatureDetailPage = [
  GoRoute(
    path: SampleFeatureDetailView.route,
    name: SampleFeatureDetailView.route,
    builder: (context, state) {
      final extra = state.extra as Map<String, dynamic>;
      final int userId = extra['id'];
      final String username = extra['username'];
      return BlocProvider(
        create:
            (_) =>
                sl<SampleFeatureDetailCubit>()
                  ..getUserDetail(userId: userId, userName: username),
        child: SampleFeatureDetailView(
          userIdArgs: userId,
          usernameArgs: username,
        ),
      );
    },
  ),
];

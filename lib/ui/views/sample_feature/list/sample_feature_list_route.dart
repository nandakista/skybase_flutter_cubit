import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:skybase/service_locator.dart';
import 'package:skybase/ui/views/sample_feature/list/sample_feature_list_view.dart';

import 'sample_feature_list_cubit.dart';

final sampleFeatureRoute = [
  GoRoute(
    path: SampleFeatureListView.route,
    name: SampleFeatureListView.route,
    builder: (context, state) {
      return BlocProvider(
        create: (context) => sl<SampleFeatureListCubit>(),
        child: const SampleFeatureListView(),
      );
    },
  ),
];

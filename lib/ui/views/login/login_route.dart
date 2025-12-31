import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:skybase/service_locator.dart';
import 'package:skybase/ui/views/login/login_view.dart';

import 'login_cubit.dart';

final loginRoute = [
  GoRoute(
    path: LoginView.route,
    name: LoginView.route,
    builder:
        (context, state) => BlocProvider(
          create: (context) => sl<LoginCubit>(),
          child: const LoginView(),
        ),
  ),
];

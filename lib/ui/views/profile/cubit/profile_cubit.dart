import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skybase/config/base/base_cubit.dart';
import 'package:skybase/data/models/user/user.dart';
import 'package:skybase/data/repositories/auth/auth_repository.dart';
import 'package:skybase/ui/views/profile/component/repository/cubit/profile_repository_cubit.dart';

part 'profile_state.dart';

class ProfileCubit extends BaseCubit<ProfileState, User> {
  String tag = 'ProfileCubit::->';

  final AuthRepository repository;

  ProfileCubit(this.repository) : super(ProfileInitial());

  @override
  void onInit([args]) {
    loadData(() => onLoadData());
    super.onInit(args);
  }

  @override
  Future<void> onRefresh([BuildContext? context]) async {
    super.onRefresh(context);
    await context?.read<ProfileRepositoryCubit>().onRefresh();
    await onLoadData();
  }

  Future<void> onLoadData() async {
    try {
      emitLoading(ProfileLoading());
      final response = await repository.getProfile(
        cancelToken: cancelToken,
        username: 'nandakista',
      );
      emitSuccess(ProfileLoaded(response));
    } catch (e) {
      emitError(ProfileError(e.toString()));
    }
  }
}

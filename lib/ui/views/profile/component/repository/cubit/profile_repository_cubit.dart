import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:skybase/config/base/base_cubit.dart';
import 'package:skybase/data/models/repo/repo.dart';
import 'package:skybase/data/repositories/auth/auth_repository.dart';

part 'profile_repository_state.dart';

class ProfileRepositoryCubit extends BaseCubit<ProfileRepositoryState, Repo> {
  String tag = 'ProfileRepositoryCubit::->';

  final AuthRepository repository;
  ProfileRepositoryCubit(this.repository) : super(ProfileRepositoryInitial());

  @override
  void onInit([args]) {
    super.onInit(args);
    loadData(() => onLoadData());
  }

  @override
  Future<void> onRefresh([BuildContext? context]) async {
    super.onRefresh(context);
    await onLoadData();
  }

  Future<void> onLoadData() async {
    try {
      emit(ProfileRepositoryLoading());
      final response = await repository.getProfileRepository(
        requestParams: requestParams,
        username: 'nandakista',
      );
      emit(ProfileRepositoryLoaded(response));
    } catch (e, stackTrace) {
      log('Error $e, $stackTrace');
      emit(ProfileRepositoryError(e.toString()));
    }
  }
}

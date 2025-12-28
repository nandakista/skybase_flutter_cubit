import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:skybase/config/base/base_cubit.dart';
import 'package:skybase/config/base/request_param.dart';
import 'package:skybase/config/base/request_state.dart';
import 'package:skybase/data/models/repo/repo.dart';
import 'package:skybase/data/repositories/auth/auth_repository.dart';
import 'package:skybase/data/sources/local/cached_key.dart';

part 'profile_repository_state.dart';

class ProfileRepositoryCubit extends BaseCubit<ProfileRepositoryState> {
  String tag = 'ProfileRepositoryCubit::->';

  final AuthRepository repository;
  ProfileRepositoryCubit(this.repository) : super(ProfileRepositoryState());

  Future<void> getProfileRepositories() async {
    try {
      emit(state.copyWith(status: RequestStatus.loading));
      final response = await repository.getProfileRepository(
        requestParams: RequestParams(
          cancelToken: cancelToken,
          cachedKey: CachedKey.USER_REPOSITORY,
        ),
        username: 'nandakista',
      );
      emit(state.copyWith(status: RequestStatus.success, result: response));
    } catch (e, stackTrace) {
      log('Error $e, $stackTrace');
      emit(state.copyWith(error: e));
    }
  }
}

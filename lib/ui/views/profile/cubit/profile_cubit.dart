import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:skybase/config/base/base_cubit.dart';
import 'package:skybase/config/base/request_param.dart';
import 'package:skybase/data/models/user/user.dart';
import 'package:skybase/data/repositories/auth/auth_repository.dart';
import 'package:skybase/data/sources/local/cached_key.dart';

part 'profile_state.dart';

class ProfileCubit extends BaseCubit<ProfileState> {
  String tag = 'ProfileCubit::->';

  final AuthRepository repository;

  ProfileCubit(this.repository) : super(ProfileInitial());

  Future<void> getProfile() async {
    try {
      emit(ProfileLoading());
      final response = await repository.getProfile(
        requestParams: RequestParams(
          cancelToken: cancelToken,
          cachedKey: CachedKey.PROFILE,
        ),
        username: 'nandakista',
      );
      emit(ProfileLoaded(response));
    } catch (e) {
      emit(ProfileError(e.toString()));
    }
  }
}

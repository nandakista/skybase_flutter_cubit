import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:skybase/config/base/base_cubit.dart';
import 'package:skybase/config/base/request_param.dart';
import 'package:skybase/config/base/request_state.dart';
import 'package:skybase/data/models/user/user.dart';
import 'package:skybase/data/repositories/auth/auth_repository.dart';

part 'profile_state.dart';

class ProfileCubit extends BaseCubit<ProfileState> {
  String tag = 'ProfileCubit::->';

  final AuthRepository repository;

  ProfileCubit(this.repository) : super(ProfileState());

  Future<void> getProfile() async {
    try {
      emit(state.copyWith(status: RequestStatus.loading));
      final response = await repository.getProfile(
        requestParams: RequestParams(cancelToken: cancelToken),
        username: 'nandakista',
      );
      emit(state.copyWith(status: RequestStatus.success, result: response));
    } catch (e) {
      emit(state.copyWith(status: RequestStatus.error, error: e));
    }
  }
}

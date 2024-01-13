import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skybase/data/models/user/user.dart';
import 'package:skybase/data/repositories/auth/auth_repository.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  String tag = 'ProfileBloc::->';

  final AuthRepository repository;
  CancelToken cancelToken = CancelToken();

  ProfileCubit(this.repository) : super(ProfileInitial()) {
    onLoadData();
  }

  Future<void> onLoadData() async {
    try {
      emit(ProfileLoading());
      final response = await repository.getProfile(
        cancelToken: cancelToken,
        username: 'nandakista',
      );
      emit(ProfileLoaded(response));
    } catch (e) {
      emit(ProfileError(e.toString()));
    }
  }

  @override
  Future<void> close() {
    cancelToken.cancel();
    return super.close();
  }
}

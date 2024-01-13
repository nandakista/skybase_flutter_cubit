import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skybase/data/models/repo/repo.dart';
import 'package:skybase/data/repositories/auth/auth_repository.dart';

part 'profile_repository_state.dart';

class ProfileRepositoryCubit extends Cubit<ProfileRepositoryState> {
  String tag = 'ProfileRepositoryBloc::->';

  final AuthRepository repository;
  CancelToken cancelToken = CancelToken();

  ProfileRepositoryCubit(this.repository) : super(ProfileRepositoryInitial()) {
    onLoadData();
  }

  void onLoadData() async {
    try {
      emit(ProfileRepositoryLoading());
      final response = await repository.getProfileRepository(
        cancelToken: cancelToken,
        username: 'nandakista',
      );
      emit(ProfileRepositoryLoaded(response));
    } catch (e) {
      emit(ProfileRepositoryError(e.toString()));
    }
  }

  @override
  Future<void> close() {
    cancelToken.cancel();
    return super.close();
  }
}

import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:skybase/config/auth_manager/auth_manager.dart';
import 'package:skybase/config/base/base_cubit.dart';
import 'package:skybase/data/repositories/auth/auth_repository.dart';

part 'login_state.dart';

class LoginCubit extends BaseCubit<LoginState, void> {
  String tag = 'LoginCubit::->';

  final AuthRepository repository;

  LoginCubit(this.repository) : super(LoginInitial());

  void onSubmit({
    required String phone,
    required String password,
  }) async {
    try {
      emit(LoginLoading());
      await repository.login(
        phoneNumber: phone,
        password: password,
      );
      emit(const LoginSuccess());
    } catch (e) {
      emit(LoginFailed(e.toString()));
    }
  }

  void onBypass() async {
    emit(LoginLoading());
    try {
      final response = await repository.getProfile(
        cancelToken: cancelToken,
        username: 'nandakista',
      );
      await AuthManager.instance.login(
        user: response,
        token: 'dummy',
        refreshToken: 'dummyRefresh',
      );
      emit(const LoginSuccess());
    } catch (e) {
      emit(LoginFailed(e.toString()));
    }
  }
}

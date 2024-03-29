import 'package:dio/dio.dart';
import 'package:skybase/data/models/repo/repo.dart';
import 'package:skybase/data/models/user/user.dart';
import 'package:skybase/data/sources/server/auth/auth_sources.dart';

import 'auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthSources apiService;

  AuthRepositoryImpl({required this.apiService});

  String tag = 'AuthRepositoryImpl::->';

  @override
  Future<User> login({
    required String phoneNumber,
    required String password,
  }) async {
    return await apiService.login(
      phoneNumber: phoneNumber,
      password: password,
    );
  }

  @override
  Future<User> verifyToken({
    required int userId,
    required String token,
  }) async {
    return await apiService.verifyToken(userId: userId, token: token);
  }

  @override
  Future<User> getProfile({
    required CancelToken cancelToken,
    required String username,
  }) async {
    return await apiService.getProfile(
      cancelToken: cancelToken,
      username: username,
    );
  }

  @override
  Future<List<Repo>> getProfileRepository({
    required CancelToken cancelToken,
    required String username,
  }) async {
    return await apiService.getProfileRepository(
      cancelToken: cancelToken,
      username: username,
    );
  }
}

import 'package:skybase/config/base/request_param.dart';
import 'package:skybase/data/models/repo/repo.dart';
import 'package:skybase/data/models/user/user.dart';

abstract interface class AuthRepository {
  Future<User> verifyToken({
    required int userId,
    required String token,
  });

  Future<User> login({
    required String phoneNumber,
    required String email,
    required String password,
  });

  Future<User> getProfile({
    required RequestParams requestParams,
    required String username,
  });

  Future<List<Repo>> getProfileRepository({
    required RequestParams requestParams,
    required String username,
  });
}

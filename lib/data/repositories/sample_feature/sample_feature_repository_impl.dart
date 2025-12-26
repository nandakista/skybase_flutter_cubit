import 'dart:developer';

import 'package:skybase/config/base/base_repository.dart';
import 'package:skybase/config/base/request_param.dart';
import 'package:skybase/data/models/sample_feature/sample_feature.dart';
import 'package:skybase/data/repositories/sample_feature/sample_feature_repository.dart';
import 'package:skybase/data/sources/server/sample_feature/sample_feature_sources.dart';

class SampleFeatureRepositoryImpl extends BaseRepository
    implements SampleFeatureRepository {
  String tag = 'SampleFeatureRepository::->';

  final SampleFeatureSources apiService;

  SampleFeatureRepositoryImpl({required this.apiService});

  @override
  Future<List<SampleFeature>> getUsers({
    required RequestParams requestParams,
    required int page,
    required int perPage,
    String? username,
  }) async {
    try {
      // Using cached
      return await loadCachedList(
        cachedKey: requestParams.cachedKey.toString(),
        loadWhen: page == 1 && username == null,
        onLoad: () async => await apiService.getUsers(
          cancelToken: requestParams.cancelToken,
          page: page,
          perPage: perPage,
          username: username,
        ),
      );

      // Without cache
      // return await apiService.getUsers(
      //   cancelToken: requestParams.cancelToken,
      //   page: page,
      //   perPage: perPage,
      //   username: username,
      // );
    } catch (e, stack) {
      log('$tag error = $e, $stack');
      rethrow;
    }
  }

  @override
  Future<SampleFeature> getDetailUser({
    required RequestParams requestParams,
    required int id,
    required String username,
  }) async {
    try {
      // Using cache
      return await loadCached(
        cachedKey: requestParams.cachedKey.toString(),
        cachedId: requestParams.cachedId,
        onLoad: () async => await apiService
            .getDetailUser(cancelToken: requestParams.cancelToken, username: username)
            .then(
          (res) async {
            res.followersList = await apiService.getFollowers(
              cancelToken: requestParams.cancelToken,
              username: username,
            );
            res.followingList = await apiService.getFollowings(
              cancelToken: requestParams.cancelToken,
              username: username,
            );
            res.repositoryList = await apiService.getRepos(
              cancelToken: requestParams.cancelToken,
              username: username,
            );
            return res;
          },
        ),
      );

      // Without Cache
      // final SampleFeature res = await apiService.getDetailUser(
      //   cancelToken: requestParams.cancelToken,
      //   username: username,
      // );
      // res.followersList = await apiService.getFollowers(
      //   cancelToken: requestParams.cancelToken,
      //   username: username,
      // );
      // res.followingList = await apiService.getFollowings(
      //   cancelToken: requestParams.cancelToken,
      //   username: username,
      // );
      // res.repositoryList = await apiService.getRepos(
      //   cancelToken: requestParams.cancelToken,
      //   username: username,
      // );
      // return res;
    } catch (e, stack) {
      log('$tag Failed get data $e, $stack');
      rethrow;
    }
  }
}

import 'dart:developer';

import 'package:skybase/data/sources/local/cache_manager.dart';
import 'package:skybase/config/base/request_param.dart';
import 'package:skybase/data/models/sample_feature/sample_feature.dart';
import 'package:skybase/data/repositories/sample_feature/sample_feature_repository.dart';
import 'package:skybase/data/sources/local/cached_key.dart';
import 'package:skybase/data/sources/server/sample_feature/sample_feature_sources.dart';

class SampleFeatureRepositoryImpl implements SampleFeatureRepository {
  String tag = 'SampleFeatureRepository::->';

  final SampleFeatureSources apiService;
  final CacheManager cacheManager;

  SampleFeatureRepositoryImpl({
    required this.apiService,
    required this.cacheManager,
  });

  @override
  Future<List<SampleFeature>> getUsers({
    required RequestParams requestParams,
    required int page,
    required int perPage,
    String? query,
  }) async {
    try {
      return cacheManager.loadCachedList(
        cachedKey: CachedKey.SAMPLE_FEATURE_LIST,
        fetchStrategy:
            page == 1 && query == null && requestParams.invalidateCache != true
                ? FetchStrategy.staleWhileRevalidate
                : FetchStrategy.invalidate,
        loader:
            () async => await apiService.getUsers(
              cancelToken: requestParams.cancelToken,
              page: page,
              perPage: perPage,
              username: query,
            ),
      );
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
      return await cacheManager.loadCachedDetail(
        fetchStrategy:
            requestParams.invalidateCache == true
                ? FetchStrategy.invalidate
                : FetchStrategy.staleWhileRevalidate,
        cachedKey: '${CachedKey.SAMPLE_FEATURE_DETAIL}/$id',
        loader:
            () async => await apiService
                .getDetailUser(
                  cancelToken: requestParams.cancelToken,
                  username: username,
                )
                .then((res) async {
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
                }),
      );
    } catch (e, stack) {
      log('$tag Failed get data $e, $stack');
      rethrow;
    }
  }
}

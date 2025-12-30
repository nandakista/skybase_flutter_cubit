/* Created by
   Varcant
   nanda.kista@gmail.com
*/

import 'dart:developer';

import 'package:skybase/core/mixin/cache_mixin.dart';

enum FetchStrategy { network, invalidate, staleWhileRevalidate }

class CacheManager with CacheMixin {
  final String _tag = 'CacheManager::->';

  Future<List<T>> loadCachedList<T>({
    required String cachedKey,
    required Future<List<T>> Function() loader,
    FetchStrategy fetchStrategy = FetchStrategy.network,
  }) async {
    try {
      switch (fetchStrategy) {
        case FetchStrategy.network:
          List<T> result = await loader();
          return result;

        case FetchStrategy.invalidate:
          List<T> result = await loader();
          await saveCachedList(key: cachedKey, list: result);
          return result;

        case FetchStrategy.staleWhileRevalidate:
          final List<T> cache = await getCachedList<T>(key: cachedKey);
          if (cache.isNotEmpty) {
            loader().then(
              (List<T> value) => saveCachedList(key: cachedKey, list: value),
            );
            return cache;
          }
          final List<T> result = await loader();
          await saveCachedList(key: cachedKey, list: result);
          return result;
      }
    } catch (e, stackTrace) {
      log('$_tag error $e, $stackTrace');
      rethrow;
    }
  }

  Future<T> loadCachedDetail<T>({
    required String cachedKey,
    required Future<T> Function() loader,
    FetchStrategy fetchStrategy = FetchStrategy.network,
  }) async {
    try {
      log('Fetch strategy $fetchStrategy');
      switch (fetchStrategy) {
        case FetchStrategy.network:
          T result = await loader();
          return result;

        case FetchStrategy.invalidate:
          T result = await loader();
          await saveCachedObject(key: cachedKey, data: result);
          return result;

        case FetchStrategy.staleWhileRevalidate:
          T? cache = await getCacheObject(key: cachedKey);

          if (cache != null) {
            loader().then(
              (T value) => saveCachedObject(key: cachedKey, data: value),
            );
            return cache;
          }
          final T result = await loader();
          await saveCachedObject(key: cachedKey, data: result);
          return result;
      }
    } catch (e, stackTrace) {
      log('$_tag error $e, $stackTrace');
      rethrow;
    }
  }
}

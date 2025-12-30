/* Created by
   Varcant
   nanda.kista@gmail.com
*/

import 'dart:developer';

import 'package:skybase/core/mixin/cache_mixin.dart';

abstract class BaseRepository with CacheMixin {
  final String _tag = 'BaseRepository::->';

  Future<List<T>> loadCachedList<T>({
    required String cachedKey,
    required Future<List<T>> Function() loader,
    bool loadWhen = false,
  }) async {
    try {
      List<T> result = [];
      if (loadWhen) {
        result = await getCachedList(key: cachedKey);
        if (result.isNotEmpty) {
          loader().then((value) => saveCachedList(key: cachedKey, list: value));
          return result;
        } else {
          result = await loader();
          await saveCachedList(key: cachedKey, list: result);
          return result;
        }
      } else {
        result = await loader();
        return result;
      }
    } catch (e, stackTrace) {
      log('$_tag error $e, $stackTrace');
      rethrow;
    }
  }

  Future<T> loadCached<T>({
    required String cachedKey,
    required Future<T> Function() loader,
    required String? cachedId,
    String? customFieldId,
  }) async {
    try {
      String key = cachedKey;
      T? cacheData = await getCacheObject(key: key);
      if (cacheData != null) {
        loader().then((value) => saveCachedObject(key: key, data: value));
        return cacheData;
      } else {
        final response = await loader();
        await saveCachedObject(key: key, data: response);
        return response;
      }
    } catch (e, stackTrace) {
      log('$_tag error $e, $stackTrace');
      rethrow;
    }
  }
}

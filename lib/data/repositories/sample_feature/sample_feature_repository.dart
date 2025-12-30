import 'package:skybase/config/base/request_param.dart';
import 'package:skybase/data/models/sample_feature/sample_feature.dart';

abstract interface class SampleFeatureRepository {
  Future<List<SampleFeature>> getUsers({
    required RequestParams requestParams,
    required int page,
    required int perPage,
    String? query,
  });

  Future<SampleFeature> getDetailUser({
    required RequestParams requestParams,
    required int id,
    required String username,
  });
}

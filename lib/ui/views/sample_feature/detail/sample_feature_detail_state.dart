part of 'sample_feature_detail_cubit.dart';

@immutable
class SampleFeatureDetailState extends Equatable {
  final RequestStatus status;
  final SampleFeature? result;
  final Object? error;

  const SampleFeatureDetailState({
    this.status = RequestStatus.initial,
    this.result,
    this.error,
  });

  SampleFeatureDetailState copyWith({
    RequestStatus? status,
    SampleFeature? result,
    Object? error,
  }) {
    return SampleFeatureDetailState(
      status: status ?? this.status,
      result: result ?? this.result,
      error: error,
    );
  }

  @override
  List<Object?> get props => [status, result, error];
}

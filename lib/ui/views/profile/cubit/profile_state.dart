part of 'profile_cubit.dart';

@immutable
class ProfileState extends Equatable {
  final RequestStatus status;
  final User? result;
  final Object? error;

  const ProfileState({
    this.status = RequestStatus.initial,
    this.result,
    this.error,
  });

  ProfileState copyWith({
    RequestStatus? status,
    User? result,
    Object? error,
  }) {
    return ProfileState(
      status: status ?? this.status,
      result: result ?? this.result,
      error: error,
    );
  }

  @override
  List<Object?> get props => [status, result, error];
}

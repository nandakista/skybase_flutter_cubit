part of 'profile_repository_cubit.dart';

@immutable
class ProfileRepositoryState extends Equatable {
  final RequestStatus status;
  final List<Repo>? result;
  final Object? error;

  const ProfileRepositoryState({
    this.status = RequestStatus.initial,
    this.result,
    this.error,
  });

  ProfileRepositoryState copyWith({
    RequestStatus? status,
    List<Repo>? result,
    Object? error,
  }) {
    return ProfileRepositoryState(
      status: status ?? this.status,
      result: result ?? this.result,
      error: error,
    );
  }

  @override
  List<Object?> get props => [status, result, error];
}

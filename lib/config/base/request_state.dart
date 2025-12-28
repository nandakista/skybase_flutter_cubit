enum RequestStatus { initial, empty, loading, success, error }

extension RequestStateExt on RequestStatus {
  bool get isInitial => this == RequestStatus.initial;

  bool get isEmpty => this == RequestStatus.empty;

  bool get isLoading => this == RequestStatus.loading;

  bool get isSuccess => this == RequestStatus.success;

  bool get isError => this == RequestStatus.error;
}
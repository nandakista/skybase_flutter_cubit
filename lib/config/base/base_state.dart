import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:skybase/config/base/request_state.dart';

@immutable
class BaseState<T> extends Equatable {
  final RequestStatus status;
  final T? result;
  final Object? error;

  const BaseState({
    this.status = RequestStatus.initial,
    this.result,
    this.error,
  });

  BaseState<T> copyWith({RequestStatus? status, T? result, Object? errorMessage}) {
    return BaseState(
      status: status ?? this.status,
      result: result ?? this.result,

      /// Prevent to save current value if error is null
      /// Because error == null indicate that the state is [loading]
      error: errorMessage,
    );
  }

  @override
  List<Object?> get props => [status, result, error];
}

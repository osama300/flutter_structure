import 'package:freezed_annotation/freezed_annotation.dart';

part 'api_state.freezed.dart';

@freezed
class ApiState<T> with _$ApiState<T> {
  const factory ApiState.initial() = _Initial;

  const factory ApiState.loading() = Loading;
  const factory ApiState.success(T data) = Success<T>;
  const factory ApiState.error({required String error}) = Error;
}

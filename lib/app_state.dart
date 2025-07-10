import 'package:freezed_annotation/freezed_annotation.dart';



part 'app_state.freezed.dart';

@freezed 
class AppState<T> with _$AppState<T>{
  const factory AppState.initial()= Initial;

  const factory AppState.loading({bool? loading}) =Loading;

  const factory AppState.error({T? data}) = Error<T>;

  const factory AppState.success({
     T? data,
    Map<String, dynamic>? extra,
  })= Success<T>;
}
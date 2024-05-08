part of 'provience_bloc.dart';

@freezed
class ProvienceState with _$ProvienceState {
  const factory ProvienceState.initial() = _Initial;
  const factory ProvienceState.loading() = _Loading;
  const factory ProvienceState.error(String message) = _Error;
  const factory ProvienceState.loaded(List<Provience> provinces) = _Loaded;
}

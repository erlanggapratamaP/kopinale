part of 'provience_bloc.dart';

@freezed
class ProvienceEvent with _$ProvienceEvent {
  const factory ProvienceEvent.started() = _Started;
  const factory ProvienceEvent.getProvinces() = _GetProvinces;
}

part of 'address_bloc.dart';

@freezed
class AddressState with _$AddressState {
  const factory AddressState.initial() = _Initial;
  const factory AddressState.loading() = _Loading;
  const factory AddressState.loaded(List<Address> addresses) = _Loaded;
  const factory AddressState.error(String errorMessage) = _Error;
}

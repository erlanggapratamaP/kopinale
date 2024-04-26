part of 'special_offers_bloc.dart';

@freezed
class SpecialOffersState with _$SpecialOffersState {
  const factory SpecialOffersState.initial() = _Initial;
  const factory SpecialOffersState.loading() = _Loading;
  const factory SpecialOffersState.loaded(List<Product> products) = _Loaded;
  const factory SpecialOffersState.error(String errorMessage) = _Error;
}

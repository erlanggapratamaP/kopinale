part of 'special_offers_bloc.dart';

@freezed
class SpecialOffersEvent with _$SpecialOffersEvent {
  const factory SpecialOffersEvent.started() = _Started;
  const factory SpecialOffersEvent.getSpecialOffers() = _GetSpecialOffers;
}

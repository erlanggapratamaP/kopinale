import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kopinale/data/datasources/product_remote_datasource.dart';

import '../../../../data/models/responses/product/datum.dart';

part 'special_offers_event.dart';
part 'special_offers_state.dart';
part 'special_offers_bloc.freezed.dart';

class SpecialOffersBloc extends Bloc<SpecialOffersEvent, SpecialOffersState> {
  final ProductRemoteDatasource _productRemoteDatasource;
  SpecialOffersBloc(this._productRemoteDatasource) : super(const _Initial()) {
    on<_GetSpecialOffers>(
      (event, emit) async {
        emit(const SpecialOffersState.loading());
        final response =
            await _productRemoteDatasource.getProductByCategory(10);
        response.fold(
          (l) => emit(
            SpecialOffersState.error(l),
          ),
          (r) => emit(
            SpecialOffersState.loaded(
              r.data?.data ?? [],
            ),
          ),
        );
      },
    );
  }
}

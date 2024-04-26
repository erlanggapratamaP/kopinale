import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kopinale/data/datasources/product_remote_datasource.dart';
import 'package:kopinale/data/models/responses/product/datum.dart';

part 'best_seller_event.dart';
part 'best_seller_state.dart';
part 'best_seller_bloc.freezed.dart';

class BestSellerBloc extends Bloc<BestSellerEvent, BestSellerState> {
  final ProductRemoteDatasource _productRemoteDatasource;
  BestSellerBloc(this._productRemoteDatasource) : super(const _Initial()) {
    on<_GetBestSellerProducts>((event, emit) async {
      emit(
        const BestSellerState.loading(),
      );
      final response = await _productRemoteDatasource.getProductByCategory(7);
      response.fold(
        (l) => emit(BestSellerState.error(l)),
        (r) => emit(
          BestSellerState.loaded(
            r.data?.data ?? [],
          ),
        ),
      );
    });
  }
}

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kopinale/data/datasources/product_remote_datasource.dart';
import 'package:kopinale/data/models/responses/product/datum.dart';

part 'all_product_event.dart';
part 'all_product_state.dart';
part 'all_product_bloc.freezed.dart';

class AllProductBloc extends Bloc<AllProductEvent, AllProductState> {
  final ProductRemoteDatasource _productRemoteDatasource;
  AllProductBloc(this._productRemoteDatasource) : super(const _Initial()) {
    on<_GetAllProduct>((event, emit) async {
      emit(const AllProductState.loading());
      final response = await _productRemoteDatasource.getAllProducts();
      response.fold(
        (l) => emit(AllProductState.error(l)),
        (r) => emit(
          AllProductState.loaded(
            r.data?.data ?? [],
          ),
        ),
      );
    });
  }
}

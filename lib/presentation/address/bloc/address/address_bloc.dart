import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kopinale/data/datasources/address_remote_datasource.dart';
import 'package:kopinale/data/models/responses/address/address.dart';

part 'address_event.dart';
part 'address_state.dart';
part 'address_bloc.freezed.dart';

class AddressBloc extends Bloc<AddressEvent, AddressState> {
  final AddressRemoteDatasource _addressRemoteDatasource;
  AddressBloc(this._addressRemoteDatasource) : super(const _Initial()) {
    on<_GetAddresses>(
      (event, emit) async {
        emit(const _Loading());
        final result = await _addressRemoteDatasource.getAddresses();
        result.fold(
          (l) => emit(
            _Error(l),
          ),
          (r) => emit(
            _Loaded(r.data ?? []),
          ),
        );
      },
    );
  }
}

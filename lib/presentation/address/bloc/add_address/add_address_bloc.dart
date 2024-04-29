import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kopinale/data/datasources/address_remote_datasource.dart';
import 'package:kopinale/data/models/requests/address_request_model.dart';

part 'add_address_event.dart';
part 'add_address_state.dart';
part 'add_address_bloc.freezed.dart';

class AddAddressBloc extends Bloc<AddAddressEvent, AddAddressState> {
  final AddressRemoteDatasource _addressRemoteDatasource;
  AddAddressBloc(this._addressRemoteDatasource) : super(const _Initial()) {
    on<_AddAddress>((event, emit) async {
      emit(const _Loading());
      final result = await _addressRemoteDatasource
          .addAddress(event.addressRequestModel.toMap());
      result.fold(
        (l) => emit(
          _Error(l),
        ),
        (r) => emit(
          const _Loaded(),
        ),
      );
    });
  }
}

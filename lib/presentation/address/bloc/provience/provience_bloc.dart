import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kopinale/data/datasources/rajaongkir_remote_datasource.dart';
import 'package:kopinale/data/models/responses/provience/provience.dart';

part 'provience_event.dart';
part 'provience_state.dart';
part 'provience_bloc.freezed.dart';

class ProvienceBloc extends Bloc<ProvienceEvent, ProvienceState> {
  final RajaongkirRemotedatasource _rajaongkirRemotedatasource;
  ProvienceBloc(this._rajaongkirRemotedatasource) : super(const _Initial()) {
    on<_GetProvinces>(
      (event, emit) async {
        emit(const _Loading());
        final result = await _rajaongkirRemotedatasource.getProvinces();
        result.fold(
          (l) => emit(
            _Error(l),
          ),
          (r) => emit(
            _Loaded(r.rajaongkir?.provience ?? []),
          ),
        );
      },
    );
  }
}

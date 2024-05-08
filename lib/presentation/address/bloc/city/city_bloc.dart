import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kopinale/data/datasources/rajaongkir_remote_datasource.dart';
import 'package:kopinale/data/models/responses/city/city.dart';

part 'city_event.dart';
part 'city_state.dart';
part 'city_bloc.freezed.dart';

class CityBloc extends Bloc<CityEvent, CityState> {
  final RajaongkirRemotedatasource _rajaongkirRemotedatasource;
  CityBloc(this._rajaongkirRemotedatasource) : super(const _Initial()) {
    on<_GetCitiesByProvience>(
      (event, emit) async {
        emit(const _Loading());
        final result = await _rajaongkirRemotedatasource
            .getCitiesByProvience(event.provId);
        result.fold(
          (l) => emit(
            _Error(l),
          ),
          (r) => emit(
            _Loaded(r.rajaongkir?.city ?? []),
          ),
        );
      },
    );
  }
}

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kopinale/data/datasources/auth_remote_datasource.dart';

part 'logout_event.dart';
part 'logout_state.dart';
part 'logout_bloc.freezed.dart';

class LogoutBloc extends Bloc<LogoutEvent, LogoutState> {
  final AuthRemoteDatasource _authRemoteDatasource;
  LogoutBloc(this._authRemoteDatasource) : super(const _Initial()) {
    on<_Logout>(
      (event, emit) async {
        emit(const _Loading());
        final response = await _authRemoteDatasource.logout();
        response.fold(
          (l) => emit(
            _Error(l),
          ),
          (r) => emit(
            const _Loaded(),
          ),
        );
      },
    );
  }
}

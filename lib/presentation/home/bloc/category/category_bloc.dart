import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kopinale/data/datasources/category_remote_datasource.dart';
import 'package:kopinale/data/models/responses/category/category.dart';

part 'category_event.dart';
part 'category_state.dart';
part 'category_bloc.freezed.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  final CategoryRemoteDatasource _categoryRemoteDatasource;
  CategoryBloc(this._categoryRemoteDatasource) : super(const _Initial()) {
    on<_GetCategories>((event, emit) async {
      final response = await _categoryRemoteDatasource.getCategories();
      response.fold(
          (l) => emit(
                CategoryState.error(l),
              ), (r) {
        emit(
          CategoryState.loaded(r.data ?? []),
        );
      });
    });
  }
}

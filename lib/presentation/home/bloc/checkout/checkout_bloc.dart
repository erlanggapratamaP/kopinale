import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kopinale/data/models/responses/product/datum.dart';
import 'package:kopinale/presentation/home/models/product_quantity.dart';

part 'checkout_event.dart';
part 'checkout_state.dart';
part 'checkout_bloc.freezed.dart';

class CheckoutBloc extends Bloc<CheckoutEvent, CheckoutState> {
  CheckoutBloc() : super(const _Loaded([])) {
    on<_AddItem>(
      (event, emit) {
        final currentState = state as _Loaded;
        if (currentState.products
            .any((element) => element.product.id == event.product.id)) {
          final index = currentState.products.indexWhere(
            (element) => element.product.id == event.product.id,
          );
          final item = currentState.products[index];
          final newItem = item.copyWith(quantity: item.quantity + 1);
          final newItems = currentState.products
              .map((e) => e == item ? newItem : e)
              .toList();
          emit(
            _Loaded(newItems),
          );
        } else {
          final newItem = ProductQuantity(product: event.product, quantity: 1);
          final newItems = [...currentState.products, newItem];
          emit(_Loaded(newItems));
        }
      },
    );
    on<_RemoveItem>(
      (event, emit) {
        final currentState = state as _Loaded;

        final hasItem = currentState.products
            .any((element) => element.product.id == event.product.id);

        if (hasItem) {
          final index = currentState.products.indexWhere(
            (element) => element.product.id == event.product.id,
          );

          final item = currentState.products[index];
          final newItem = item.copyWith(quantity: item.quantity - 1);
          if (newItem.quantity == 0) {
            final newItems = currentState.products
                .where((element) => element.product.id != event.product.id)
                .toList();
            // newItems.removeWhere(
            //   (element) => element == newItem,
            // );
            emit(_Loaded(newItems));
          } else {
            final newItems = currentState.products
                .map((e) => e == item ? newItem : e)
                .toList();
            emit(
              _Loaded(newItems),
            );
          }
        }

        return;
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../../../core/components/spaces.dart';
import '../../../core/constants/variables.dart';
import '../../../core/core.dart';
import '../../home/bloc/checkout/checkout_bloc.dart';
import '../../home/models/product_quantity.dart';

class CartTile extends StatelessWidget {
  final ProductQuantity data;
  const CartTile({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(10.0)),
      child: Slidable(
        endActionPane: ActionPane(
          extentRatio: 0.25,
          motion: const StretchMotion(),
          children: [
            SlidableAction(
              onPressed: (context) {},
              backgroundColor: AppColors.primary.withOpacity(0.44),
              foregroundColor: AppColors.red,
              icon: Icons.delete_outlined,
              borderRadius: const BorderRadius.horizontal(
                right: Radius.circular(10.0),
              ),
            ),
          ],
        ),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 10.0),
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.stroke),
          ),
          child: Stack(
            alignment: Alignment.bottomRight,
            children: [
              Row(
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                    child: Image.network(
                      data.product.image!.contains('http')
                          ? data.product.image!
                          : '${Variables.baseUrlImage}${data.product.image}',
                      width: 68.0,
                      height: 68.0,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SpaceWidth(14.0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        data.product.name!,
                        style: const TextStyle(
                          fontSize: 16,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                      Row(
                        children: [
                          Text(
                            data.product.price!.currencyFormatRp,
                            style: const TextStyle(
                              color: AppColors.primary,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(5.0)),
                    child: InkWell(
                      onTap: () {
                        context
                            .read<CheckoutBloc>()
                            .add(CheckoutEvent.removeItem(data.product));
                      },
                      child: const ColoredBox(
                        color: AppColors.primary,
                        child: Padding(
                          padding: EdgeInsets.all(4.0),
                          child: Icon(
                            Icons.remove,
                            color: AppColors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SpaceWidth(4.0),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('${data.quantity}'),
                  ),
                  const SpaceWidth(4.0),
                  ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(5.0)),
                    child: InkWell(
                      onTap: () {
                        context
                            .read<CheckoutBloc>()
                            .add(CheckoutEvent.addItem(data.product));
                      },
                      child: const ColoredBox(
                        color: AppColors.primary,
                        child: Padding(
                          padding: EdgeInsets.all(4.0),
                          child: Icon(
                            Icons.add,
                            color: AppColors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

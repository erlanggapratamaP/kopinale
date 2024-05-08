import 'package:flutter/material.dart';
import 'package:kopinale/core/components/loading_shimmer.dart';
import 'package:kopinale/data/models/responses/address/address.dart';

import '../../../core/components/spaces.dart';
import '../../../core/core.dart';

class AddressTileLoading extends StatelessWidget {
  final Address data;

  const AddressTileLoading({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(12.0)),
          boxShadow: [
            BoxShadow(
              color: AppColors.black.withOpacity(0.1),
              blurRadius: 2,
              offset: const Offset(0, 2),
              spreadRadius: 0,
              blurStyle: BlurStyle.outer,
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SpaceHeight(24.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: LoadingShimmer(
                child: Text(
                  '${data.name} - ${data.phone}',
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                ),
              ),
            ),
            const SpaceHeight(4.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: LoadingShimmer(
                      child: Text(
                        '${data.fullAddress}',
                        style: const TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                  const SpaceWidth(14.0),
                  const LoadingShimmer(
                    child: Icon(
                      Icons.circle_outlined,
                      color: AppColors.grey,
                    ),
                  ),
                ],
              ),
            ),
            const SpaceHeight(24.0),
            // if (isSelected) ...[
            //   const Divider(color: AppColors.primary),
            //   Center(
            //     child: TextButton(
            //       onPressed: (){},
            //       child: const Text('Edit'),
            //     ),
            //   ),
            // ],
          ],
        ),
      ),
    );
  }
}

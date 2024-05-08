import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kopinale/core/components/loading_shimmer.dart';
import 'package:kopinale/core/components/spaces.dart';
import 'package:kopinale/core/router/app_router.dart';
import 'package:kopinale/data/models/responses/address/address.dart';
import 'package:kopinale/presentation/address/widgets/address_tile.dart';
import 'package:kopinale/presentation/address/widgets/address_tile_loading.dart';

class AddressListLoading extends StatelessWidget {
  const AddressListLoading({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Address> addresses = [
      Address(
          name: 'Erlan',
          fullAddress: '21130 McKenzie Meadows Margarettown, NJ 58423',
          phone: '12312312321312'),
      Address(
          name: 'Erlan',
          fullAddress: '21130 McKenzie Meadows Margarettown, NJ 58423',
          phone: '12312312321312')
    ];
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 2,
      itemBuilder: (context, index) => AddressTileLoading(
        data: addresses[index],
      ),
      separatorBuilder: (context, index) => const SpaceHeight(16.0),
    );
  }
}

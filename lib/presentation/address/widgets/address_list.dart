import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kopinale/core/components/spaces.dart';
import 'package:kopinale/core/router/app_router.dart';
import 'package:kopinale/data/models/responses/address/address.dart';
import 'package:kopinale/presentation/address/widgets/address_tile.dart';

class AddressList extends StatelessWidget {
  final List<Address> addresses;
  const AddressList({
    required this.addresses,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: addresses.length,
      itemBuilder: (context, index) => AddressTile(
        isSelected: false,
        data: addresses[index],
        onTap: () {
          // selectedIndex = index;
          // setState(() {});
        },
        onEditTap: () {
          context.goNamed(
            RouteConstants.editAddress,
            pathParameters: PathParameters(
              rootTab: RootTab.order,
            ).toMap(),
            extra: addresses[index],
          );
        },
      ),
      separatorBuilder: (context, index) => const SpaceHeight(16.0),
    );
  }
}

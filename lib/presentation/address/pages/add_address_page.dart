import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:kopinale/data/models/responses/provience/provience.dart';
import 'package:kopinale/presentation/address/bloc/city/city_bloc.dart';
import 'package:kopinale/presentation/address/bloc/provience/provience_bloc.dart';

import '../../../core/components/buttons.dart';
import '../../../core/components/custom_dropdown.dart';
import '../../../core/components/custom_text_field.dart';
import '../../../core/components/spaces.dart';

class AddAddressPage extends StatefulWidget {
  const AddAddressPage({super.key});

  @override
  State<AddAddressPage> createState() => _AddAddressPageState();
}

class _AddAddressPageState extends State<AddAddressPage> {
  @override
  void initState() {
    super.initState();
    context.read<ProvienceBloc>().add(const ProvienceEvent.getProvinces());
  }

  @override
  Widget build(BuildContext context) {
    final firstNameController = TextEditingController();
    final addressController = TextEditingController();
    final cityController = TextEditingController();
    final provinceController = TextEditingController();
    final zipCodeController = TextEditingController();
    final phoneNumberController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Adress'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20.0),
        children: [
          const SpaceHeight(24.0),
          CustomTextField(
            controller: firstNameController,
            label: 'Nama',
          ),
          const SpaceHeight(24.0),
          CustomTextField(
            controller: addressController,
            label: 'Alamat jalan',
          ),
          const SpaceHeight(24.0),
          BlocBuilder<ProvienceBloc, ProvienceState>(
            builder: (context, state) {
              return state.maybeWhen(
                orElse: () => const Center(
                  child: CircularProgressIndicator(),
                ),
                loaded: (provinces) => CustomDropdown<Provience>(
                  value: provinces.first,
                  items: provinces,
                  label: 'Provinsi',
                  onChanged: (value) {
                    context.read<CityBloc>().add(CityEvent.getCitiesByProvience(
                        value?.provinceId ?? ""));
                  },
                ),
              );
            },
          ),
          BlocBuilder<CityBloc, CityState>(
            builder: (context, state) {
              return state.maybeWhen(
                orElse: () => const Center(
                  child: CircularProgressIndicator(),
                ),
                loaded: (cities) => CustomDropdown(
                    value: cities.first, items: cities, label: 'City'),
              );
            },
          ),
          CustomTextField(
            controller: cityController,
            label: 'Kota',
          ),
          const SpaceHeight(24.0),
          CustomTextField(
            controller: provinceController,
            label: 'Provinsi',
          ),
          const SpaceHeight(24.0),
          CustomTextField(
            controller: zipCodeController,
            label: 'Kode Pos',
          ),
          const SpaceHeight(24.0),
          CustomTextField(
            controller: phoneNumberController,
            label: 'No Handphone',
          ),
          const SpaceHeight(24.0),
          Button.filled(
            onPressed: () {
              context.pop();
            },
            label: 'Tambah Alamat',
          ),
        ],
      ),
    );
  }
}

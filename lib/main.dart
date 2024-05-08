import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kopinale/core/constants/colors.dart';
import 'package:kopinale/core/router/app_router.dart';
import 'package:kopinale/data/datasources/address_remote_datasource.dart';
import 'package:kopinale/data/datasources/auth_remote_datasource.dart';
import 'package:kopinale/data/datasources/category_remote_datasource.dart';
import 'package:kopinale/data/datasources/product_remote_datasource.dart';
import 'package:kopinale/data/datasources/rajaongkir_remote_datasource.dart';
import 'package:kopinale/presentation/address/bloc/add_address/add_address_bloc.dart';
import 'package:kopinale/presentation/address/bloc/address/address_bloc.dart';
import 'package:kopinale/presentation/address/bloc/city/city_bloc.dart';
import 'package:kopinale/presentation/address/bloc/provience/provience_bloc.dart';
import 'package:kopinale/presentation/auth/bloc/login/login_bloc.dart';
import 'package:kopinale/presentation/auth/bloc/logout/logout_bloc.dart';
import 'package:kopinale/presentation/home/bloc/all_product/all_product_bloc.dart';
import 'package:kopinale/presentation/home/bloc/best_seller/best_seller_bloc.dart';
import 'package:kopinale/presentation/home/bloc/category/category_bloc.dart';
import 'package:kopinale/presentation/home/bloc/checkout/checkout_bloc.dart';
import 'package:kopinale/presentation/home/bloc/special_offers/special_offers_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final appRouter = AppRouter();
    final router = appRouter.router;
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CategoryBloc(
            CategoryRemoteDatasource(),
          ),
        ),
        BlocProvider(
          create: (context) => AllProductBloc(
            ProductRemoteDatasource(),
          ),
        ),
        BlocProvider(
          create: (context) => BestSellerBloc(
            ProductRemoteDatasource(),
          ),
        ),
        BlocProvider(
          create: (context) => SpecialOffersBloc(
            ProductRemoteDatasource(),
          ),
        ),
        BlocProvider(
          create: (context) => CheckoutBloc(),
        ),
        BlocProvider(
          create: (context) => LoginBloc(
            AuthRemoteDatasource(),
          ),
        ),
        BlocProvider(
          create: (context) => LogoutBloc(AuthRemoteDatasource()),
        ),
        BlocProvider(
          create: (context) => AddressBloc(AddressRemoteDatasource()),
        ),
        BlocProvider(
          create: (context) => AddAddressBloc(AddressRemoteDatasource()),
        ),
        BlocProvider(
          create: (context) => ProvienceBloc(RajaongkirRemotedatasource()),
        ),
        BlocProvider(
          create: (context) => CityBloc(RajaongkirRemotedatasource()),
        )
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primary),
          textTheme: GoogleFonts.poppinsTextTheme(
            Theme.of(context).textTheme,
          ),
          appBarTheme: AppBarTheme(
            color: AppColors.white,
            titleTextStyle: GoogleFonts.quicksand(
              color: AppColors.primary,
              fontSize: 18.0,
              fontWeight: FontWeight.w700,
            ),
            iconTheme: const IconThemeData(
              color: AppColors.black,
            ),
            centerTitle: true,
            shape: Border(
              bottom: BorderSide(
                color: AppColors.black.withOpacity(0.05),
              ),
            ),
          ),
        ),
        routerDelegate: router.routerDelegate,
        routeInformationParser: router.routeInformationParser,
        routeInformationProvider: router.routeInformationProvider,
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:kopinale/core/assets/assets.gen.dart';
import 'package:kopinale/core/components/search_input.dart';
import 'package:kopinale/core/components/spaces.dart';
import 'package:kopinale/core/router/app_router.dart';
import 'package:kopinale/presentation/home/bloc/all_product/all_product_bloc.dart';
import 'package:kopinale/presentation/home/bloc/best_seller/best_seller_bloc.dart';
import 'package:kopinale/presentation/home/bloc/checkout/checkout_bloc.dart';
import 'package:kopinale/presentation/home/bloc/special_offers/special_offers_bloc.dart';
import 'package:kopinale/presentation/home/widgets/banner_slider.dart';
import 'package:kopinale/presentation/home/widgets/organism/menu_categories.dart';
import 'package:kopinale/presentation/home/widgets/organism/product_list.dart';
import 'package:kopinale/presentation/home/widgets/title_content.dart';
import 'package:badges/badges.dart' as badges;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late TextEditingController searchController;

  final List<String> banners1 = [
    Assets.images.banner1.path,
    Assets.images.banner1.path,
  ];
  final List<String> banners2 = [
    Assets.images.banner2.path,
    Assets.images.banner2.path,
    Assets.images.banner2.path,
  ];
  @override
  void initState() {
    searchController = TextEditingController();
    context.read<AllProductBloc>().add(const AllProductEvent.getAllProducts());
    context
        .read<BestSellerBloc>()
        .add(const BestSellerEvent.getBestSellerProducts());
    context.read<SpecialOffersBloc>().add(
          const SpecialOffersEvent.getSpecialOffers(),
        );
    super.initState();
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kopinale'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Assets.icons.notification.svg(height: 24.0),
          ),
          BlocBuilder<CheckoutBloc, CheckoutState>(
            builder: (context, state) {
              return state.maybeWhen(
                loaded: (checkout) {
                  final totalQuantity = checkout.fold(
                      0,
                      (previousValue, element) =>
                          previousValue + element.quantity);
                  return totalQuantity > 0
                      ? badges.Badge(
                          badgeContent: Text(
                            '$totalQuantity',
                            style: const TextStyle(color: Colors.white),
                          ),
                          child: IconButton(
                            onPressed: () {
                              context.goNamed(
                                RouteConstants.cart,
                                pathParameters: PathParameters().toMap(),
                              );
                            },
                            icon: Assets.icons.cart.svg(height: 24.0),
                          ),
                        )
                      : IconButton(
                          onPressed: () {
                            context.goNamed(
                              RouteConstants.cart,
                              pathParameters: PathParameters().toMap(),
                            );
                          },
                          icon: Assets.icons.cart.svg(height: 24.0),
                        );
                },
                orElse: () => const SizedBox.shrink(),
              );
            },
          ),
          const SizedBox(
            width: 16,
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          SearchInput(
            controller: searchController,
            onTap: () {
              context.pushReplacementNamed(
                RouteConstants.root,
                pathParameters: PathParameters(
                  rootTab: RootTab.explore,
                ).toMap(),
              );
            },
          ),
          const SpaceHeight(16.0),
          // BannerSlider(items: banners1),
          // const SpaceHeight(12.0),
          TitleContent(
            title: 'Categories',
            onSeeAllTap: () {},
          ),
          const SpaceHeight(12.0),
          const MenuCategories(),
          const SpaceHeight(50.0),
          BlocBuilder<AllProductBloc, AllProductState>(
            builder: (context, state) {
              return state.maybeWhen(
                loaded: (products) {
                  return ProductList(
                    title: 'Featured Product',
                    onSeeAllTap: () {},
                    items:
                        products.length > 2 ? products.sublist(0, 2) : products,
                  );
                },
                orElse: () => const SizedBox.shrink(),
                loading: () => const Center(
                  child: CircularProgressIndicator(),
                ),
                error: (message) => Center(
                  child: Text(message),
                ),
              );
            },
          ),
          const SpaceHeight(50.0),
          BannerSlider(items: banners2),
          const SpaceHeight(28.0),
          BlocBuilder<BestSellerBloc, BestSellerState>(
            builder: (context, state) {
              return state.maybeWhen(
                loaded: (products) => ProductList(
                  title: 'Best Sellers',
                  onSeeAllTap: () {},
                  items:
                      products.length > 2 ? products.sublist(0, 2) : products,
                ),
                orElse: () => const SizedBox.shrink(),
                loading: () => const Center(
                  child: CircularProgressIndicator(),
                ),
                error: (message) => Center(
                  child: Text(message),
                ),
              );
            },
          ),
          // const SpaceHeight(50.0),
          // ProductList(
          //   title: 'New Arrivals',
          //   onSeeAllTap: () {},
          //   items: newArrivals,
          // ),
          // const SpaceHeight(50.0),
          // ProductList(
          //   title: 'Top Rated Product',
          //   onSeeAllTap: () {},
          //   items: topRatedProducts,
          // ),
          const SpaceHeight(50.0),
          BlocBuilder<SpecialOffersBloc, SpecialOffersState>(
            builder: (context, state) {
              return state.maybeWhen(
                loaded: (products) => ProductList(
                  title: 'Special Offers',
                  onSeeAllTap: () {},
                  items:
                      products.length > 2 ? products.sublist(0, 2) : products,
                ),
                orElse: () => const SizedBox.shrink(),
                loading: () => const Center(
                  child: CircularProgressIndicator(),
                ),
                error: (message) => Center(
                  child: Text(message),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

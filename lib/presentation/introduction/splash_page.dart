import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kopinale/core/constants/colors.dart';
import 'package:kopinale/core/router/app_router.dart';
// import 'package:kopinale/core/router/route_constants.dart';
import '../../core/core.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    Future.delayed(
      const Duration(seconds: 3),
      () => context.goNamed(RouteConstants.root,
          pathParameters: PathParameters().toMap()),
    );
    return const Scaffold(
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(30.0),
        child: Text(
          'Kopinale your Coffe Taste',
          style: TextStyle(
            color: AppColors.grey,
            fontWeight: FontWeight.w600,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

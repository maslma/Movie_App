import 'dart:async';
import 'package:flutter/material.dart';
import 'package:movie_app/presentation/presentation_managers/exports.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  Timer? _timer;

  _statrtDelay() {
    _timer = Timer(const Duration(seconds: AppConst.splashDelay), _goNext);
  }

  _goNext() {
    // debugPrint(token);
    // token == null
    //     ?
    Navigator.pushReplacementNamed(context, Routes.navBarRoute);
    //     : Navigator.of(context, rootNavigator: true).pushAndRemoveUntil(MaterialPageRoute(
    //         builder: (context) {
    //           HomeCubit.get(context).getBanners();
    //           HomeCubit.get(context).getCategories();
    //           HomeCubit.get(context).getProducts();
    //           CartCubit.get(context).getCart();
    //           FavoriteCubit.get(context).getFavorites();
    //           ProfileCubit.get(context).getUserProfile();
    //           return const BottomNavView();
    //         },
    //       ), (route) => false);
  }

  @override
  void initState() {
    super.initState();
    token = CachHelper.getData(key: 'token');
    _statrtDelay();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.primaryColor,
      body: Stack(
        children: [
          Positioned(
            left: 0,
            right: 0,
            top: 300.h,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                   "T M D B",
                  style: TextStyle(
                    fontSize: 50.sp,
                    color: ColorManager.secondColor,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            top: 370.h,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                   "     Millions of movies, TV shows \nand people to discover Explore now.",
                  style: TextStyle(
                    fontSize: 20.sp,
                    color: ColorManager.secondColor,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 60.h,
            left: 170.w,
            child: const CircularProgressIndicator(
              color: ColorManager.secondColor,
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}

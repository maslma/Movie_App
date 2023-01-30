import 'dart:async';
import 'package:flutter/material.dart';
import 'package:movie_app/presentation/presentation_managers/assets_managers.dart';
import 'package:movie_app/presentation/presentation_managers/exports.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  Timer? _timer;

  _statrtDelay() {
    _timer = Timer(const Duration(milliseconds: AppConst.splashDelay), _goNext);
  }

  _goNext() {
    // debugPrint(token);
    // token == null
    //     ? Navigator.pushReplacementNamed(context, Routes.loginRoute)
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
      body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(
            height: AppSize.s200.h,
            width: AppSize.s200.w,
            image: const AssetImage(
              ImageAssets.splash,
            ),
          ),
              SizedBox(
                height: AppSize.s40.h,
              ),
              Text(
            AppStrings.splash,
            style: Theme.of(context).textTheme.labelMedium!.copyWith(
                  color: ColorManager.black,
                ),
          ),
        ],
      )),
    );
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}

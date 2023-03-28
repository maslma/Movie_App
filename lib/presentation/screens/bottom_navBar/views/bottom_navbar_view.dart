import 'package:flutter/material.dart';
import 'package:movie_app/presentation/presentation_managers/exports.dart';

class BottomNavView extends StatelessWidget {
  const BottomNavView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BottomNavCubit, BottomNavState>(
      listener: (context, state) {},
      builder: (context, state) {
        BottomNavCubit cubit = BottomNavCubit.get(context);
        return Scaffold(
          body: PersistentTabView(
            context,
            //controller: _controller,
            screens: cubit.screens,
            items: cubit.items,
            confineInSafeArea: true,
            backgroundColor: ColorManager.primaryColor, // Default is Colors.white.
            // decoration: NavBarDecoration(
            //   borderRadius: BorderRadius.circular(AppSize.s20.r),
            // ),
            // margin: EdgeInsets.symmetric(horizontal: AppSize.s14.w, vertical: AppSize.s14.h),
            // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
            resizeToAvoidBottomInset: false,
            stateManagement: true, // Default is true.
            // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
            hideNavigationBarWhenKeyboardShows: true,
            popAllScreensOnTapOfSelectedTab: true,
            popActionScreens: PopActionScreensType.all,
            itemAnimationProperties: const ItemAnimationProperties(
              duration: Duration(milliseconds: 150),
              curve: Curves.ease,
            ),
            screenTransitionAnimation: const ScreenTransitionAnimation(
              animateTabTransition: true,
              curve: Curves.ease,
              duration: Duration(milliseconds: 150),
            ),
            navBarStyle: NavBarStyle.style9, // Choose the nav bar style with this property.
            bottomScreenMargin: 0.0,
          ),
        );
      },
    );
  }
}

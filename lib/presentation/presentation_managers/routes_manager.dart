import 'package:flutter/material.dart';
import 'package:movie_app/domain/models/movie/movie_details_model.dart';
import 'package:movie_app/presentation/presentation_managers/exports.dart';


class Routes {
  static const String splashRoute = '/';
  // static const String onboardingRoute = '/onboardingRoute';
  // static const String loginRoute = '/login';
  // static const String registerRoute = '/register';
  // static const String forgotPasswordRoute = '/forgotPasswor';
  // static const String mainRoute = '/main';
  // static const String homeRoute = '/home';
  static const String navBarRoute = '/navBar';
  // static const String cateRoute = '/cate';
}

class RoutesGenerator {
  static Route<dynamic> getRoutes(RouteSettings settings) {
    switch (settings.name) {
      case Routes.navBarRoute:
        return MaterialPageRoute(builder: (_) => const BottomNavView());
      case Routes.splashRoute:
        return MaterialPageRoute(builder: (_) => const SplashView());
      // case Routes.registerRoute:
      //   return MaterialPageRoute(builder: (_) => const RegisterView());
      // case Routes.homeRoute:
      //   return MaterialPageRoute(builder: (_) =>  const HomeView());

      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
        builder: (_) => Scaffold(
              appBar: AppBar(
                title:  const Text('No Route'),
              ),
              body:  const Center(child: Text('No Route')),
            ));
  }
}

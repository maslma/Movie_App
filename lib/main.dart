import 'package:flutter/material.dart';
import 'package:movie_app/data/remote/dio_helper.dart';
import 'package:movie_app/presentation/presentation_managers/exports.dart';
import 'package:movie_app/presentation/screens/home/view_model/home_cubit.dart';
import 'package:movie_app/presentation/screens/trailers/view_model/trailers_cubit.dart';
import 'package:movie_app/presentation/screens/tvs/view_model/tv_cubit.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  await CachHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(377, 813),
      minTextAdapt: true,
      splitScreenMode: true,
      useInheritedMediaQuery: true,
      builder: (BuildContext context, Widget? child) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(create: (context) => BottomNavCubit()),
            BlocProvider(create: (context) => HomeCubit()),
            BlocProvider(create: (context) => TvCubit()),
            BlocProvider(create: (context) => TrailersCubit()),
          ],
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Movie App',
            theme: getApplicationTheme(),
            onGenerateRoute: RoutesGenerator.getRoutes,
            initialRoute: Routes.splashRoute,
          ),
        );
      },
    );
  }
}

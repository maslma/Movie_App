import 'package:flutter/material.dart';
import 'package:movie_app/data/remote/dio_helper.dart';
import 'package:movie_app/presentation/presentation_managers/exports.dart';
import 'package:movie_app/presentation/screens/home/view_model/home_cubit.dart';



Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  await CachHelper.init();
  // await dotenv.load(fileName: ".env");
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
        return  MultiBlocProvider(
          providers: [
            BlocProvider(create: (context) => BottomNavCubit()),
            BlocProvider(create: (context) => HomeCubit()),
          ],
          child: MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Shop App',
              theme: getApplicationTheme(),
              onGenerateRoute: RoutesGenerator.getRoutes,
              initialRoute: Routes.navBarRoute,
            ),
        );
      },
    );
  }
}

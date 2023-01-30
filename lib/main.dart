import 'package:flutter/material.dart';
import 'package:movie_app/presentation/presentation_managers/exports.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';



Future main() async {
  await dotenv.load(fileName: ".env");
  runApp (const MyApp());
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

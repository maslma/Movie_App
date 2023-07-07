import 'package:movie_app/presentation/presentation_managers/exports.dart';

class GlobalLoadingWidget extends StatelessWidget {
  const GlobalLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return  Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            width: double.infinity,
            height: 100.h,
          )
        ],
      ),
    );
  }
}

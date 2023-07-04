import 'package:movie_app/presentation/presentation_managers/exports.dart';

class GlobalErrorWidget extends StatelessWidget {
  final dynamic error;
  const GlobalErrorWidget({required this.error, super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'Something is wrong : $error',
            style:  TextStyle(
              fontSize: AppSize.s20.sp,
              color: ColorManager.white,
            ),
          )
        ],
      ),
    );
  }
}

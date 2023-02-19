import 'package:flutter/material.dart';
import 'package:movie_app/presentation/presentation_managers/exports.dart';

class LoadingIndicator extends StatelessWidget {

  const LoadingIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children:  <Widget>[
          SizedBox(
            width: AppSize.s25.w,
            height: AppSize.s25.w,
            child: CircularProgressIndicator(
              color: ColorManager.white,
              strokeWidth: AppSize.s4.w,
            ),
          )
        ],
      ),
    );
  }
}

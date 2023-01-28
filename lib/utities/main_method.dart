import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../data/local/chach_helper.dart';


navTo({
  required String routeName,
  required BuildContext context,
}) {
  Navigator.of(context).pushNamed(routeName);
}

void showToast({
  required String text,
  required ToastState state,
}) {
  Fluttertoast.showToast(
      msg: text,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 5,
      backgroundColor: chooseToastColor(state),
      textColor: Colors.white,
      fontSize: 16.0);
}

enum ToastState { SUCCESS, ERORR, WARNING }

Color chooseToastColor(ToastState state) {
  Color color;
  switch (state) {
    case ToastState.SUCCESS:
      color = Colors.green;
      break;
    case ToastState.ERORR:
      color = Colors.red;
      break;
    case ToastState.WARNING:
      color = Colors.amber;
      break;
  }
  return color;
}

Widget myDivider() =>Padding(
  padding: const EdgeInsetsDirectional.only(
    start:20.0,
    end: 20.0
  ),
  child: Container(
    width:double.infinity,
    height:1.0 ,
    color:Colors.grey[500] ,
  ),
);
void navigateAndFinish(context , widget ) => Navigator.pushAndRemoveUntil(
  context,

  MaterialPageRoute(
    builder:(context) => widget,
  ),
      (route){
    return false;
  },
);

String? token = CachHelper.getData(key: 'token');

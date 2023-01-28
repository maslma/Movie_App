import 'package:flutter/material.dart';
import 'package:movie_app/presentation/presentation_managers/exports.dart';

class GlobalButton extends StatelessWidget {
  final double? buttonHight;
  final Function() onPressed;
  final Widget? child;
  final String? textCild;
  const GlobalButton({
    super.key,
    this.buttonHight,
    required this.onPressed,
    this.child,
    this.textCild,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(AppSize.s25.r),
      child: SizedBox(
        width: double.infinity.w,
        height: buttonHight ?? AppSize.s55.h,
        child: ElevatedButton(
          onPressed: onPressed,
          child: child ?? Text(textCild ?? 'Button'),
        ),
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:movie_app/presentation/presentation_managers/exports.dart';
//
// class RegisterView extends StatelessWidget {
//   const RegisterView({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocConsumer<RegisterCubit, RegisterState>(
//       listener: (context, state) {
//         if (state is RegisterSuccessState) {
//           if (state.registerModel!.status!) {
//             showToast(text: state.registerModel!.message!, state: ToastState.SUCCESS);
//             Navigator.of(context, rootNavigator: true).push(
//               MaterialPageRoute(builder: (context) => const LoginView()),
//             );
//           } else {
//             showToast(text: state.registerModel!.message!, state: ToastState.ERORR);
//           }
//         }
//       },
//       builder: (context, state) {
//         RegisterCubit cubit = RegisterCubit.get(context);
//         return Scaffold(
//           backgroundColor: ColorManager.primary,
//           body: Padding(
//             padding: EdgeInsets.symmetric(horizontal: AppSize.s16.w),
//             child: Center(
//               child: SizedBox(
//                 height: AppSize.s600.h,
//                 width: AppSize.s500.w,
//                 child: DecoratedBox(
//                   decoration: BoxDecoration(
//                     color: ColorManager.white,
//                     borderRadius: BorderRadius.circular(AppSize.s14.r),
//                   ),
//                   child: SingleChildScrollView(
//                     physics: const BouncingScrollPhysics(),
//                     child: Form(
//                       key: cubit.formKey,
//                       child: Column(
//                         children: [
//                           SizedBox(height: AppSize.s28.h),
//                           Text(
//                             AppStrings.register,
//                             style: Theme.of(context).textTheme.labelMedium,
//                           ),
//                           SizedBox(height: AppSize.s40.h),
//                           Padding(
//                             padding: EdgeInsets.symmetric(horizontal: AppPadding.p28.w),
//                             child: GlobalTextFormField(
//                               textInputType: TextInputType.name,
//                               textController: cubit.nameController,
//                               vaildMessage: AppStrings.usernameError,
//                               decoration: const InputDecoration(
//                                 hintText: AppStrings.username,
//                                 labelText: AppStrings.username,
//                               ),
//                             ),
//                           ),
//                           SizedBox(height: AppSize.s20.h),
//                           Padding(
//                             padding: EdgeInsets.symmetric(horizontal: AppPadding.p28.w),
//                             child: GlobalTextFormField(
//                               textInputType: TextInputType.emailAddress,
//                               textController: cubit.emailController,
//                               vaildMessage: AppStrings.usernameError,
//                               decoration: const InputDecoration(
//                                 hintText: AppStrings.emailHint,
//                                 labelText: AppStrings.emailHint,
//                               ),
//                             ),
//                           ),
//                           SizedBox(height: AppSize.s20.h),
//                           Padding(
//                             padding: EdgeInsets.symmetric(horizontal: AppPadding.p28.w),
//                             child: GlobalTextFormField(
//                               textInputType: TextInputType.phone,
//                               textController: cubit.phoneController,
//                               vaildMessage: AppStrings.usernameError,
//                               decoration: const InputDecoration(
//                                 hintText: AppStrings.phone,
//                                 labelText: AppStrings.phone,
//                               ),
//                             ),
//                           ),
//                           SizedBox(height: AppSize.s20.h),
//                           Padding(
//                             padding: EdgeInsets.symmetric(horizontal: AppPadding.p28.w),
//                             child: GlobalTextFormField(
//                               textInputType: TextInputType.visiblePassword,
//                               textController: cubit.passwordController,
//                               vaildMessage: AppStrings.passwordError,
//                               isPassword: true,
//                               decoration: const InputDecoration(
//                                 hintText: AppStrings.password,
//                                 labelText: AppStrings.password,
//                               ),
//                             ),
//                           ),
//                           SizedBox(height: AppSize.s28.h),
//                           Padding(
//                             padding: const EdgeInsets.symmetric(horizontal: AppPadding.p28),
//                             child: SizedBox(
//                               height: AppSize.s50.h,
//                               width: double.infinity.w,
//                               child: ConditionalBuilder(
//                                 condition: state is! RegisterLoadingState,
//                                 builder: (context) => ElevatedButton(
//                                   onPressed: () {
//                                     if (cubit.formKey.currentState!.validate()) {
//                                       cubit.userRegister(
//                                           name: cubit.nameController.text,
//                                           email: cubit.emailController.text,
//                                           password: cubit.passwordController.text,
//                                           phone: cubit.phoneController.text);
//                                     }
//                                   },
//                                   child: const Text(
//                                     AppStrings.register,
//                                   ),
//                                 ),
//                                 fallback: (context) => const Center(
//                                   child: CircularProgressIndicator(),
//                                 ),
//                               ),
//                             ),
//                           ),
//                           SizedBox(height: AppSize.s28.h),
//                           Padding(
//                             padding: EdgeInsets.symmetric(horizontal: AppPadding.p28.w),
//                             child: Row(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: [
//                                 const Text(
//                                   AppStrings.haveAccount,
//                                   style: TextStyle(
//                                     //color: ColorManager.primary,
//                                     fontSize: AppSize.s14,
//                                   ),
//                                 ),
//                                 GlobalTextButton(
//                                   onPressed: () {
//                                     Navigator.of(context).pop();
//                                   },
//                                   text: AppStrings.login,
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         );
//       },
//     );
//   }
// }

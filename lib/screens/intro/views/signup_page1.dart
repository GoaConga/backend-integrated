// import 'package:flutter/material.dart';
// // import 'package:flutter_svg/svg.dart';
// import 'package:get/get.dart';
// import 'package:internsforyou/screens/intro/controller.dart';
// // import 'package:smooth_page_indicator/smooth_page_indicator.dart';

// // import '../../../theme/app_decoration.dart';
// import '../../../theme/app_style.dart';
// import '../../../utils/color_constant.dart';
// import '../../../utils/image_constant.dart';
// import '../../../utils/math_utils.dart';
// // import '../../../utils/routes/app_routes.dart';

// class RegisterScreen extends GetView<RegisterController> {
//   RegisterScreen({Key? key}) : super(key: key);
//   final TextEditingController _controlEmail = TextEditingController();
//   // final TextEditingController _controlPassword = TextEditingController();
//   // final TextEditingController _controlConfirmPassword = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//         child: Scaffold(
//       backgroundColor: ColorConstant.gray800,
//       body: SizedBox(
//           width: size.width,
//           child: Stack(alignment: Alignment.bottomCenter, children: [
//             Align(
//                 alignment: Alignment.center,
//                 child: Image.asset(ImageConstant.kImgWA, fit: BoxFit.fill)),
//             Column(
//                 mainAxisAlignment: MainAxisAlignment.end,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   const Align(
//                     alignment: Alignment.topCenter,
//                     child: Padding(
//                         padding: EdgeInsets.all(10.0),
//                         child: Text(
//                           'Basic Accont Details',
//                           style: TextStyle(
//                               fontSize: 20, fontWeight: FontWeight.bold),
//                         )),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.all(10.0),
//                     child: TextFormField(
//                       decoration: const InputDecoration(
//                         labelText: 'Email Address',
//                         border: OutlineInputBorder(),
//                         suffixIcon: Icon(
//                           Icons.error,
//                         ),
//                       ),
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.all(10.0),
//                     child: TextFormField(
//                       obscureText: true,
//                       decoration: const InputDecoration(
//                         labelText: 'Password',
//                         border: OutlineInputBorder(),
//                         suffixIcon: Icon(
//                           Icons.error,
//                         ),
//                       ),
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.all(10.0),
//                     child: TextFormField(
//                       obscureText: true,
//                       decoration: const InputDecoration(
//                         labelText: 'Confirm Password',
//                         border: OutlineInputBorder(),
//                         suffixIcon: Icon(
//                           Icons.error,
//                         ),
//                       ),
//                     ),
//                   ),
//                   Padding(
//                       padding:
//                           const EdgeInsets.fromLTRB(10.0, 20.0, 10.0, 20.0),
//                       child: Align(
//                           child: ElevatedButton(
//                               onPressed: () {},
//                               style: ElevatedButton.styleFrom(
//                                   fixedSize: const Size(475, 60),
//                                   primary: Colors.white30),
//                               child: Text(
//                                 "Continue Anonymously".tr,
//                                 textAlign: TextAlign.left,
//                                 style: AppStyle.textStyleRobotoCondensedlight24,
//                               ))))
//                 ])
//           ])
//           // )
//           ),
//     ));
//   }
// }

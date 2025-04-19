// import 'package:course_getx/main.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class Login extends StatelessWidget {
//   const Login({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Login')),
//       body: Container(
//         alignment: Alignment.center,
//         padding: EdgeInsets.symmetric(horizontal: 10),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             ElevatedButton(
//               onPressed: () {
//                 sharedPref!.setString("role", "user");
//                 Get.offNamed("home");
//               },
//               child: const Text('Login'),
//             ),
//             ElevatedButton(
//               onPressed: () {
//                 sharedPref!.setString("role", "admin");
//                 Get.offNamed("admin");
//               },
//               child: const Text('Login Admin'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

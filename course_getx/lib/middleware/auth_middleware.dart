// import 'package:course_getx/main.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class AuthMiddleware extends GetMiddleware {
//   @override
//   int? get priority => 2;
//   @override
//   RouteSettings? redirect(String? route) {
//     if (sharedPref!.getString("id") == null) {
//       return RouteSettings(name: "/");
//     }
//     if (sharedPref!.getString("role") == 'user') {
//       return RouteSettings(name: "home");
//     }
//     if (sharedPref!.getString("role") == "admin") {
//       return RouteSettings(name: "admin");
//     }
//     return null;
//   }
// }

import 'package:get/get.dart';
import 'package:flutter/material.dart';

class SuperMiddleware extends GetMiddleware {
  bool myvar = true;

  @override
  int? get priority => 1;
  @override
  RouteSettings? redirect(String? route) {
    if (myvar) {
      return RouteSettings(name: "super");
    }
    return null;
  }
}

 import 'package:flutter/material.dart';

class AppRouteObserver extends RouteObserver<PageRoute<dynamic>> {
  @override
  void subscribe(RouteAware routeAware, ModalRoute<dynamic>? route) {
    if (route is PageRoute) {
      super.subscribe(routeAware, route);
    }
  }
}
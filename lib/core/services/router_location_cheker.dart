 import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

String getCurrentRouteIndex(BuildContext context) {
    final GoRouter _router = GoRouter.of(context);
    final RouteMatch lastMatch =
        _router.routerDelegate.currentConfiguration.last;
    final RouteMatchList matchList = lastMatch is ImperativeRouteMatch
        ? lastMatch.matches
        : _router.routerDelegate.currentConfiguration;
    final String location = matchList.uri.toString();
    return location;
  }
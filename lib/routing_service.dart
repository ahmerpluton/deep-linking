import 'package:deep_linking/main.dart';
import 'package:flutter/material.dart';

class RoutingService {
  static push(page) async {
    await Navigator.push(
      NavigationService.navigatorKey.currentContext!,
      MaterialPageRoute(builder: (context) => page),
    );
  }

  static pushReplacement(page) async {
    await Navigator.pushReplacement(
      NavigationService.navigatorKey.currentContext!,
      MaterialPageRoute(builder: (context) => page),
    );
  }

  static pushAndRemoveUntil(page) async {
    await Navigator.pushAndRemoveUntil(
      NavigationService.navigatorKey.currentContext!,
      MaterialPageRoute(builder: (context) => page),
      (Route<dynamic> route) => false,
    );
  }
}
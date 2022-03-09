import 'package:bike_catalog/app.dart';
import 'package:bike_catalog/setup.dart';
import 'package:flutter/material.dart';

void main() {
  configureDependencies();
  runApp(locateService<App>());
}

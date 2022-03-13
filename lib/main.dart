import 'package:flutter/material.dart';

import 'package:bike_catalog/app.dart';
import 'package:bike_catalog/setup.dart';

void main() async {
  configureDependencies();
  runApp(locateService<App>());
}

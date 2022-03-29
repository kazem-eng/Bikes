import 'package:flutter/material.dart';

import 'package:bikes/app.dart';
import 'package:bikes/setup.dart';

void main() async {
  configureDependencies();
  runApp(locateService<App>());
}

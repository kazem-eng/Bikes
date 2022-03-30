import 'package:flutter/material.dart';

import 'package:bikes/app.dart';
import 'package:bikes/setup.dart';

void main() async {
  await configureDependencies();
  runApp(locateService<App>());
}

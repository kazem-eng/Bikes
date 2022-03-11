import 'package:flutter/material.dart';

import 'package:bike_catalog/constants/constants.dart';

class EmptyIndicator extends StatelessWidget {
  const EmptyIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size.width;
    return Center(
      child: Image.asset(
        Resources.emptyIndicator,
        height: screenSize / 2,
        width: screenSize / 2,
      ),
    );
  }
}

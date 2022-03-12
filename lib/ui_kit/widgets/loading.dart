import 'package:flutter/material.dart';

import 'package:bike_catalog/theme/theme.dart';

class Loading extends StatelessWidget {
  const Loading({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appTheme = AppTheme.of(context).theme;
    final size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: size.height,
      color: appTheme.colors.disabledPrimaryBackground.withOpacity(.5),
      child: const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}

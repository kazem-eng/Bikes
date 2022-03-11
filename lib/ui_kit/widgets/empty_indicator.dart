import 'package:flutter/material.dart';

import 'package:bike_catalog/constants/strings.dart';
import 'package:bike_catalog/theme/theme.dart';
import 'package:bike_catalog/ui_kit/widgets/Label.dart';

class EmptyIndicator extends StatelessWidget {
  const EmptyIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appTheme = AppTheme.of(context).theme;
    return Center(
      child: Label(
        Strings.emptyList,
        typography: TypographyFamily.headline1,
        color: appTheme.colors.defaultText,
      ),
    );
  }
}

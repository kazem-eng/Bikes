import 'package:flutter/material.dart';

import 'package:bike_catalog/constants/constants.dart';
import 'package:bike_catalog/ui_kit/ui_kit.dart';

abstract class DialogHelper {
  static Future<void> show<T>({
    required BuildContext context,
    String? title,
    String? barrierLabel,
    List<DialogAction>? actions,
    Widget? body,
    Widget? header,
    Widget? image,
    double? maxHeight,
    double? width,
    bool isDismissible = true,
    bool? isEnable,
    Alignment? alignment,
    bool Function()? canDismiss,
    ComponentStyle dialogType = ComponentStyle.primary,
  }) {
    assert(
      !isDismissible || barrierLabel != null,
      Api.dialogErrorException,
    );
    return showGeneralDialog(
      context: context,
      barrierDismissible: isDismissible,
      barrierLabel: barrierLabel,
      pageBuilder: (context, _, __) {
        return WillPopScope(
          onWillPop: () {
            if (canDismiss != null) {
              return Future.value(canDismiss.call());
            } else {
              return Future.value(true);
            }
          },
          child: CustomDialog(
            header: header,
            title: title,
            body: body,
            actions: actions,
            image: image,
            maxHeight: maxHeight,
            width: width,
            isEnable: isEnable ?? true,
            alignment: alignment ?? Alignment.center,
            dialogStyle: dialogType,
          ),
        );
      },
    );
  }
}

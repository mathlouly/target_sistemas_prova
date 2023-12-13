import 'package:flutter/material.dart';
import 'package:target_sistemas_prova/app/app.dart';
import 'package:target_sistemas_prova/app/configs/constants/spacements.dart';
import 'package:target_sistemas_prova/app/configs/theme/app_color_style.dart';

class PrimaryButton extends OutlinedButton {
  PrimaryButton({
    super.key,
    VoidCallback? onPressed,
    required String text,
    Color? textColor,
    Color? bgColor,
    double? elevation,
    Size? size,
    double? width,
    double? height,
    EdgeInsets? padding,
    bool loading = false,
    Color? loadingColor,
    BorderRadiusGeometry? borderRadius,
    bool expanded = false,
  }) : super(
          onPressed: onPressed,
          style: OutlinedButton.styleFrom(
            backgroundColor: bgColor ?? AppColors.success,
            shape: borderRadius != null
                ? RoundedRectangleBorder(borderRadius: BorderRadius.circular(4))
                : const StadiumBorder(),
            side: BorderSide.none,
            elevation: elevation ?? 0,
            shadowColor: AppColors.black,
            padding: padding ??
                const EdgeInsets.symmetric(
                  horizontal: Spacements.S,
                  vertical: Spacements.S,
                ),
          ),
          child: SizedBox(
            width: width,
            height: height,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: expanded ? MainAxisSize.max : MainAxisSize.min,
              children: [
                loading
                    ? SizedBox(
                        width: Spacements.M,
                        height: Spacements.M,
                        child: Center(
                          child: CircularProgressIndicator(
                            color: loadingColor ?? AppColors.light,
                            strokeWidth: Spacements.XXS,
                          ),
                        ),
                      )
                    : Text(
                        text,
                        style: Theme.of(globalKey.currentContext!).textTheme.labelLarge?.copyWith(
                              color: textColor ?? AppColors.light,
                            ),
                      ),
              ],
            ),
          ),
        );
}

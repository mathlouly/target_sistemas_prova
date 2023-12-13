import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:target_sistemas_prova/app/configs/theme/app_color_style.dart';

class Utils {
  static Future<bool?> showDialogChooseOption(
    BuildContext context, {
    String? title,
  }) async {
    var styleBtn = Theme.of(context).textTheme.labelLarge!;
    bool? chooseOption;

    await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: AppColors.light,
          title: Text(
            title ?? '',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          actions: [
            TextButton(
              onPressed: () {
                chooseOption = true;
                context.pop();
              },
              child: Text(
                'Sim',
                style: styleBtn.copyWith(
                  color: AppColors.error,
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                chooseOption = false;
                context.pop();
              },
              child: Text(
                'Não',
                style: styleBtn.copyWith(
                  color: AppColors.success,
                ),
              ),
            ),
          ],
        );
      },
    );

    return chooseOption;
  }
}

import 'package:flutter/material.dart';
import 'package:target_sistemas_prova/app/configs/constants/spacements.dart';
import 'package:target_sistemas_prova/app/configs/theme/app_color_style.dart';

class CustomTextFormField extends StatelessWidget {
  final String? title;
  final Color? titleColor;
  final String? hintText;
  final Color? bgColor;
  final IconData? prefixIcon;
  final bool isPassword;
  final TextEditingController? textController;
  final Function(String?)? onChange;
  final Function()? onEditingComplete;
  final String? Function(String?)? validator;
  final EdgeInsets? padding;
  final FocusNode? focusNode;
  final bool autoFocus;

  const CustomTextFormField({
    super.key,
    this.title,
    this.titleColor,
    this.hintText,
    this.bgColor,
    this.prefixIcon,
    this.isPassword = false,
    this.textController,
    this.onChange,
    this.onEditingComplete,
    this.validator,
    this.padding,
    this.focusNode,
    this.autoFocus = false,
  });

  @override
  Widget build(BuildContext context) {
    final border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(Spacements.XS),
      borderSide: const BorderSide(
        color: AppColors.light,
        width: 2,
      ),
    );

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title != null) ...[
          Text(
            title!,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: titleColor ?? AppColors.light),
          ),
          const SizedBox(height: Spacements.XXS),
        ],
        TextFormField(
          focusNode: focusNode,
          controller: textController,
          onChanged: onChange,
          onEditingComplete: onEditingComplete,
          validator: validator,
          style: Theme.of(context).textTheme.bodyMedium,
          obscureText: isPassword,
          autofocus: autoFocus,
          decoration: InputDecoration(
            filled: true,
            contentPadding: padding ?? const EdgeInsets.all(Spacements.XS),
            fillColor: bgColor ?? AppColors.light,
            hintText: hintText,
            hintStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(color: AppColors.midGray),
            errorStyle: Theme.of(context).textTheme.labelSmall!.copyWith(color: AppColors.error),
            prefixIcon: prefixIcon != null ? Icon(prefixIcon) : null,
            prefixIconColor: AppColors.black,
            border: border,
            enabledBorder: border,
            errorBorder: border.copyWith(
              borderSide: const BorderSide(
                color: AppColors.error,
                width: 2,
              ),
            ),
            focusedBorder: border,
            disabledBorder: border,
            focusedErrorBorder: border.copyWith(
              borderSide: const BorderSide(
                color: AppColors.error,
                width: 2,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

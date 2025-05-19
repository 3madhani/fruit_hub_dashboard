import 'package:flutter/material.dart';

import '../utils/app_colors.dart';
import '../utils/app_text_styles.dart';

class CustomTextFormField extends StatelessWidget {
  final String hintText;
  final TextInputType keyboardType;
  final Widget? suffixIcon;
  final void Function(String?)? onSaved;
  final int? maxLines;

  const CustomTextFormField({
    super.key,
    required this.hintText,
    required this.keyboardType,
    this.suffixIcon,
    this.onSaved,
    this.maxLines,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: maxLines ?? 1,
      onSaved: onSaved,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'الرجاء إدخال $hintText';
        }
        return null;
      },
      keyboardType: keyboardType,
      style: AppTextStyles.semiBold16.copyWith(color: AppColors.primaryColor),
      decoration: InputDecoration(
        suffixIcon: suffixIcon,
        hintText: hintText,
        hintStyle: AppTextStyles.bold13.copyWith(
          color: const Color(0xff949D9E),
        ),
        filled: true,
        fillColor: const Color(0xffF9FAFA),
        border: buildBorder(),
        focusedBorder: buildBorder(AppColors.primaryLightColor),
        enabledBorder: buildBorder(),
      ),
    );
  }

  OutlineInputBorder buildBorder([Color? borderColor]) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(4),
      borderSide: BorderSide(color: borderColor ?? const Color(0xffE6E9EA)),
    );
  }
}

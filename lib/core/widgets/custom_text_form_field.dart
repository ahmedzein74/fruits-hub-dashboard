import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruits_hub_dashboard/core/utils/app_text_styels.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField(
      {super.key,
      required this.hintText,
      required this.textInputType,
      this.suffixIcon,
      this.validator,
      this.onSaved,
      this.isPassword = false,
      this.maxLines = 1});
  final String hintText;
  final TextInputType textInputType;
  final Widget? suffixIcon;
  final String? Function(String?)? validator;
  final void Function(String?)? onSaved;
  final bool isPassword;
  final int? maxLines;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: TextFormField(
        maxLines: maxLines,
        obscureText: isPassword,
        onSaved: onSaved,
        validator: validator,
        keyboardType: textInputType,
        decoration: InputDecoration(
          isDense: true,
          suffixIcon: suffixIcon,
          contentPadding:
              EdgeInsets.symmetric(horizontal: 20.w, vertical: 17.h),
          hintText: hintText,
          hintStyle: TextStyles.bold13.copyWith(
            color: Colors.grey,
          ),

          border: buildBorder(),
          enabledBorder: buildBorder(),
          focusedBorder: buildBorder(),
          // focusedErrorBorder: buildErrorBorder(),
        ),
      ),
    );
  }

  OutlineInputBorder buildBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: const BorderSide(
        color: Colors.grey,
      ),
    );
  }
}

import 'package:easacc/core/theme/app_colors.dart';
import 'package:easacc/core/utils/screen_size.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    required this.title,
    required this.onTap,
    super.key,
    this.height,
    this.isLoading = false,
    this.textColor = AppColor.white,
    this.background = AppColor.primaryBlue,
    this.borderColor = AppColor.primaryBlue,
    this.loadingColor = AppColor.white,
    this.fontWeight = FontWeight.w600,
    this.fontSize,
    this.borderRadius = 8,
  });

  final String title;
  final double? height;
  final bool isLoading;
  final Function()? onTap;
  final Color textColor;
  final Color background;
  final Color borderColor;
  final Color loadingColor;
  final FontWeight fontWeight;
  final double? fontSize;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    final bool isDisabled = onTap == null;
    final Color effectiveBackground = isDisabled
        ? AppColor.lightGrey
        : background;
    final Color effectiveTextColor = isDisabled ? AppColor.grey : textColor;
    final Color effectiveBorderColor = isDisabled
        ? AppColor.lightGrey
        : borderColor;
    return ConstrainedBox(
      constraints: const BoxConstraints(maxHeight: 55),
      child: Opacity(
        opacity: isDisabled ? 0.7 : 1.0,
        child: MaterialButton(
          height: height ?? 45,
          onPressed: onTap,
          minWidth: double.infinity,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
            side: BorderSide(color: effectiveBorderColor),
          ),
          elevation: 0,
          focusElevation: 0,
          hoverElevation: 0,
          highlightElevation: 0,
          color: effectiveBackground,
          focusColor: effectiveBackground,
          hoverColor: effectiveBackground,
          splashColor: effectiveBackground,
          highlightColor: effectiveBackground,
          textColor: effectiveTextColor,
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: AppSize.widthScale(context, fontSize ?? 14),
              fontWeight: fontWeight,
              color: effectiveTextColor,
            ),
          ),
        ),
      ),
    );
  }
}

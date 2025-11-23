import 'package:easacc/core/theme/app_colors.dart';
import 'package:easacc/core/utils/screen_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'custom_border.dart';

class CustomFormFiled extends StatelessWidget {
  const CustomFormFiled({
    required this.hint,
    super.key,
    this.title,
    this.controller,
    this.validator,
    this.onSubmit,
    this.onChanged,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.textDirection,
    this.inputDirection,
    this.prefix,
    this.suffix,
    this.maxLines = 1,
    this.minLines = 1,
    this.filledColor = Colors.white,
    this.maxLen,
    this.titleColor = const Color(0xff51555C),
    this.borderRadius = 8.0,
    this.height = 0.095,
    this.withShadow = true,
    this.formatter,
    this.focusNode,
    this.withColoredBorder = false,
    this.enabled = true,
    this.hintFontSize,
    this.readOnly,
  });

  final String? title;
  final String hint;
  final bool obscureText;
  final bool withColoredBorder;
  final bool enabled;
  final TextDirection? inputDirection;
  final TextDirection? textDirection;
  final TextEditingController? controller;
  final TextInputType keyboardType;
  final FormFieldValidator<String>? validator;
  final Function(String)? onSubmit;
  final Function(String)? onChanged;
  final Widget? prefix;
  final Widget? suffix;
  final int maxLines;
  final int minLines;
  final Color filledColor;
  final Color titleColor;
  final int? maxLen;
  final double? borderRadius;
  final double? height;
  final bool withShadow;
  final List<TextInputFormatter>? formatter;
  final FocusNode? focusNode;
  final double? hintFontSize;
  final bool? readOnly;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title != null && title != '')
          Text(
            title!,
            style: TextStyle(
              fontSize: AppSize.widthScale(context, 13),
              color: titleColor,
              fontWeight: FontWeight.w500,
            ),
          ),
        if (title != null && title != '')
          SizedBox(height: AppSize.heightScale(context, 8)),
        SizedBox(
          height: AppSize.widthScale(
            context,
            minLines > 1 ? minLines * 30.0 : 45,
          ),
          child: TextFormField(
            focusNode: focusNode,
            controller: controller,
            validator: validator ?? (val) => null,
            enabled: enabled,
            inputFormatters: formatter ?? [],
            maxLength: maxLen,
            maxLines: maxLines,
            minLines: minLines,
            onChanged: onChanged,
            obscureText: obscureText,
            onFieldSubmitted: onSubmit,
            keyboardType: keyboardType,
            textDirection: textDirection,
            readOnly: readOnly ?? false,
            style: TextStyle(
              color: AppColor.primaryBlue,
              fontSize: AppSize.widthScale(context, 13),
            ),
            decoration: InputDecoration(
              counterText: '',
              errorBorder: OutlineShadowInputBorder(
                backgroundColor: filledColor,
                boxShadow: [],
                borderSide: const BorderSide(color: AppColor.red),
                borderRadius: BorderRadius.circular(borderRadius!),
              ),
              border: OutlineShadowInputBorder(
                backgroundColor: filledColor,
                boxShadow: [],
                borderSide: BorderSide(
                  color: withColoredBorder
                      ? AppColor.lightGrey
                      : Colors.transparent,
                ),
                borderRadius: BorderRadius.circular(borderRadius!),
              ),

              enabledBorder: OutlineShadowInputBorder(
                backgroundColor: filledColor,
                boxShadow: [],
                borderSide: BorderSide(
                  color: withColoredBorder
                      ? AppColor.lightGrey
                      : Colors.transparent,
                  width: 1,
                  style: BorderStyle.solid,
                ),
                borderRadius: BorderRadius.circular(borderRadius!),
              ),

              focusedBorder: OutlineShadowInputBorder(
                backgroundColor: filledColor,
                boxShadow: [],
                borderSide: BorderSide(
                  color: withColoredBorder
                      ? AppColor.primaryBlue
                      : Colors.transparent,
                  width: 1,
                  style: BorderStyle.solid,
                ),
                borderRadius: BorderRadius.circular(borderRadius!),
              ),

              hintText: hint,
              hintStyle: TextStyle(
                fontSize: hintFontSize ?? AppSize.widthScale(context, 14),
                color: AppColor.grey,
              ),
              hintTextDirection: textDirection,
              filled: true,
              fillColor: filledColor,
              contentPadding: EdgeInsets.symmetric(
                horizontal: AppSize.widthScale(context, 12),
                vertical: AppSize.heightScale(context, 8),
              ),

              /// Error
              errorMaxLines: 1,
              errorText: null,
              errorStyle: TextStyle(
                height: 0.01,
                fontSize: AppSize.widthScale(context, 0),
              ),

              /// ICON
              prefixIcon: prefix,
              prefixIconConstraints: const BoxConstraints(),

              /// ICON BUTTON
              suffixIcon: suffix,
              suffixIconConstraints: const BoxConstraints(),
            ),
          ),
        ),
      ],
    );
  }
}

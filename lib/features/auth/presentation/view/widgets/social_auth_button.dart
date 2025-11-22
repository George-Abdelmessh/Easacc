import 'package:easacc/core/theme/app_colors.dart';
import 'package:easacc/core/utils/screen_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SocialAuthButton extends StatelessWidget {
  const SocialAuthButton({
    required this.image,
    required this.onPressed,
    required this.title,
    super.key,
  });

  final String image;
  final String title;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: double.infinity,
        height: AppSize.heightScale(context, 40),
        decoration: BoxDecoration(
          color: AppColor.white,
          border: Border.all(color: AppColor.grey),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              image,
              width: AppSize.widthScale(context, 22),
              height: AppSize.heightScale(context, 22),
            ),
            const SizedBox(width: 10),
            Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: AppColor.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

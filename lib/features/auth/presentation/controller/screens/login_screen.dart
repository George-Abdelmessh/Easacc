import 'package:easacc/core/constants/asset_paths.dart';
import 'package:easacc/core/theme/app_colors.dart';
import 'package:easacc/core/utils/screen_size.dart';
import 'package:flutter/material.dart';

import '../widgets/social_auth_button.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Welcome',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
              ),
              SizedBox(height: AppSize.heightScale(context, 2)),
              const Text(
                'Login to continue',
                style: TextStyle(fontSize: 16, color: AppColor.grey),
              ),
              Divider(
                color: AppColor.lightGrey,
                thickness: 1,
                endIndent: AppSize.widthScale(context, 100),
                indent: AppSize.widthScale(context, 100),
              ),
              SizedBox(height: AppSize.heightScale(context, 20)),
              SocialAuthButton(
                image: AppAssets.google,
                title: 'Sign in with Google',
                onPressed: () {},
              ),
              SizedBox(height: AppSize.heightScale(context, 10)),
              SocialAuthButton(
                image: AppAssets.facebook,
                title: 'Continue with Facebook',
                onPressed: () {},
              ),
              SizedBox(height: AppSize.heightScale(context, 30)),
              GestureDetector(
                onTap: () {},
                child: const Text(
                  'Go to Settings',
                  style: TextStyle(
                    fontSize: 16,
                    color: AppColor.lightBlue,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

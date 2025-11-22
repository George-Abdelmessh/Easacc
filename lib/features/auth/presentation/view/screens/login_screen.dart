import 'package:easacc/core/constants/asset_paths.dart';
import 'package:easacc/core/router/app_routes.dart';
import 'package:easacc/core/theme/app_colors.dart';
import 'package:easacc/core/utils/screen_size.dart';
import 'package:easacc/features/auth/presentation/controller/facebook_auth_service.dart';
import 'package:easacc/features/auth/presentation/controller/google_auth_service.dart';
import 'package:easacc/features/auth/presentation/view/widgets/social_auth_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  void _signInWithGoogle(BuildContext context) {
    GoogleAuthService.instance.signInWithGoogle().then((result) {
      if (result.isRight()) {
        _navigateToHome(context);
      }
    });
  }

  void _signInWithFacebook(BuildContext context) {
    FacebookAuthService.instance.signInWithFacebook().then((result) {
      if (result.isRight()) {
        _navigateToHome(context);
      }
    });
  }

  void _navigateToHome(BuildContext context) {
    context.pushReplacement(AppRoutes.home);
  }

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
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.w700),
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

              /// Google Login Button
              SocialAuthButton(
                image: AppAssets.google,
                title: 'Sign in with Google',
                onPressed: () => _signInWithGoogle(context),
              ),
              SizedBox(height: AppSize.heightScale(context, 10)),

              /// Facebook Login Button
              SocialAuthButton(
                image: AppAssets.facebook,
                title: 'Continue with Facebook',
                onPressed: () => _signInWithFacebook(context),
              ),
              SizedBox(height: AppSize.heightScale(context, 30)),

              /// Go to Settings Button
              GestureDetector(
                onTap: () => _navigateToHome(context),
                child: const Text(
                  'Go to Home Screen',
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

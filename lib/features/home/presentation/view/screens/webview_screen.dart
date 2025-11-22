import 'package:easacc/core/constants/asset_paths.dart';
import 'package:easacc/core/services/cache/shared_preferences_service.dart';
import 'package:easacc/core/services/cache/shared_prefs_keys.dart';
import 'package:easacc/core/theme/app_colors.dart';
import 'package:easacc/core/utils/screen_size.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebviewScreen extends StatefulWidget {
  const WebviewScreen({super.key});

  @override
  State<WebviewScreen> createState() => _WebviewScreenState();
}

class _WebviewScreenState extends State<WebviewScreen> {
  late final WebViewController controller;
  bool isLoading = true;
  final String? url = SharedPreferencesService.getData(
    key: SharedPrefsKeys.url,
  );

  @override
  void initState() {
    super.initState();
    _initWebView();
  }

  void _initWebView() {
    if (url == null) return;
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(AppColor.lightGrey.withOpacity(0.2))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (progress) {
            setState(() {
              isLoading = progress == 100;
            });
          },
          onPageStarted: (url) {
            setState(() {
              isLoading = true;
            });
          },
          onPageFinished: (url) {
            setState(() {
              isLoading = false;
            });
          },
        ),
      )
      ..loadRequest(Uri.parse(url ?? ''));
  }

  @override
  Widget build(BuildContext context) {
    return url == null
        ? _buildEmptyUrlWidget()
        : isLoading
        ? _buildLoadingWidget()
        : _buildWebViewWidget();
  }

  Widget _buildLoadingWidget() {
    return const Center(child: CircularProgressIndicator());
  }

  Widget _buildWebViewWidget() {
    return WebViewWidget(controller: controller);
  }

  Widget _buildEmptyUrlWidget() {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: AppSize.widthScale(context, 40),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            AppAssets.noUrl,
            width: AppSize.widthScale(context, 130),
            height: AppSize.heightScale(context, 130),
          ),
          SizedBox(height: AppSize.heightScale(context, 20)),
          const Text(
            'No URL found, please go to settings to set the URL',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: AppColor.black,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

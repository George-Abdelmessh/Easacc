import 'package:easacc/core/custom_widgeta/custom_form_field.dart';
import 'package:easacc/core/custom_widgeta/custom_widget.dart';
import 'package:easacc/core/services/cache/shared_preferences_service.dart';
import 'package:easacc/core/services/cache/shared_prefs_keys.dart';
import 'package:easacc/core/theme/app_colors.dart';
import 'package:easacc/core/utils/screen_size.dart';
import 'package:easacc/core/utils/validators.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  final String? url = SharedPreferencesService.getData(
    key: SharedPrefsKeys.url,
  );
  late final TextEditingController websiteUrlController = TextEditingController(
    text: url,
  );
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    websiteUrlController.dispose();
    super.dispose();
  }

  void _onSave() {
    if (formKey.currentState!.validate()) {
      SharedPreferencesService.saveData(
        key: SharedPrefsKeys.url,
        value: websiteUrlController.text,
      );
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('URL saved successfully')),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter a valid URL')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: AppSize.widthScale(context, 20),
        vertical: AppSize.heightScale(context, 20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Settings',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
          ),
          SizedBox(height: AppSize.heightScale(context, 10)),
          Form(
            key: formKey,
            child: Container(
              padding: const EdgeInsets.all(12),
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppColor.darkBlue.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Website URL',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: AppColor.darkGrey,
                    ),
                  ),
                  SizedBox(height: AppSize.heightScale(context, 10)),
                  CustomFormFiled(
                    hint: 'https://www.example.com',
                    controller: websiteUrlController,
                    validator: (value) => value?.url(),
                  ),
                  SizedBox(height: AppSize.heightScale(context, 20)),
                  const Text(
                    'Network Device',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: AppColor.black,
                    ),
                  ),
                  SizedBox(height: AppSize.heightScale(context, 8)),
                  DecoratedBox(
                    decoration: BoxDecoration(
                      color: AppColor.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: DropdownButton<String>(
                      value: 'A',
                      hint: const Text('Select an item'),
                      padding: EdgeInsets.symmetric(
                        horizontal: AppSize.widthScale(context, 12),
                      ),
                      isExpanded: true,
                      underline: const SizedBox.shrink(),
                      dropdownColor: AppColor.white,
                      borderRadius: BorderRadius.circular(12),
                      items: const [
                        DropdownMenuItem(value: 'A', child: Text('Option A')),
                        DropdownMenuItem(value: 'B', child: Text('Option B')),
                        DropdownMenuItem(value: 'C', child: Text('Option C')),
                      ],
                      onChanged: (value) {
                        setState(() {
                          // selectedValue = value!;
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: AppSize.heightScale(context, 12)),
          CustomButton(title: 'Save', onTap: _onSave),
        ],
      ),
    );
  }
}

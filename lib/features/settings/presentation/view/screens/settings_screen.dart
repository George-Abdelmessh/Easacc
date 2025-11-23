import 'package:easacc/core/custom_widgeta/custom_form_field.dart';
import 'package:easacc/core/custom_widgeta/custom_widget.dart';
import 'package:easacc/core/services/cache/shared_preferences_service.dart';
import 'package:easacc/core/services/cache/shared_prefs_keys.dart';
import 'package:easacc/core/theme/app_colors.dart';
import 'package:easacc/core/utils/screen_size.dart';
import 'package:easacc/core/utils/validators.dart';
import 'package:easacc/features/settings/presentation/controller/settings_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  late final SettingCubit cubit;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final String? url = SharedPreferencesService.getData(
    key: SharedPrefsKeys.url,
  );
  late final TextEditingController websiteUrlController;

  @override
  void initState() {
    super.initState();
    websiteUrlController = TextEditingController(text: url);
    cubit = SettingCubit();
  }

  @override
  void dispose() {
    websiteUrlController.dispose();
    cubit.close();
    super.dispose();
  }

  void _onSave() {
    if (formKey.currentState!.validate()) {
      cubit.saveSettings(url: websiteUrlController.text);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Settings saved successfully')),
      );
    } else {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Please enter a valid URL')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => cubit,
      child: Padding(
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
                    // Website URL Form Field
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

                    // Network Device Dropdown
                    const Text(
                      'Network Device',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: AppColor.black,
                      ),
                    ),
                    SizedBox(height: AppSize.heightScale(context, 8)),
                    BlocBuilder<SettingCubit, SettingStates>(
                      builder: (innerContext, state) {
                        return DecoratedBox(
                          decoration: BoxDecoration(
                            color: AppColor.white,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: DropdownButton<String>(
                            value: cubit.selectedDevice,
                            hint: const Text('Select a network device'),
                            padding: EdgeInsets.symmetric(
                              horizontal: AppSize.widthScale(context, 12),
                            ),
                            isExpanded: true,
                            underline: const SizedBox.shrink(),
                            dropdownColor: AppColor.white,
                            borderRadius: BorderRadius.circular(12),
                            items: const [
                              DropdownMenuItem(
                                value: 'Wifi',
                                child: Text('Wifi'),
                              ),
                              DropdownMenuItem(
                                value: 'Bluetooth',
                                child: Text('Bluetooth'),
                              ),
                            ],
                            onChanged: (value) {
                              cubit.changeSelectedDevice(value ?? '');
                            },
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),

            // Save Button
            SizedBox(height: AppSize.heightScale(context, 12)),
            CustomButton(title: 'Save', onTap: _onSave),
          ],
        ),
      ),
    );
  }
}

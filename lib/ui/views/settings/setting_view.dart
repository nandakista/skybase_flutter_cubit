import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:skybase/app_configuration.dart';
import 'package:skybase/config/themes/app_style.dart';
import 'package:skybase/config/themes/theme_manager/theme_manager.dart';
import 'package:skybase/ui/views/settings/cubit/setting_cubit.dart';
import 'package:skybase/ui/widgets/colored_status_bar.dart';
import 'package:skybase/ui/widgets/sky_appbar.dart';
import 'package:skybase/ui/widgets/sky_button.dart';

class SettingView extends StatefulWidget {
  static const String route = '/setting';

  const SettingView({super.key});

  @override
  State<SettingView> createState() => _SettingViewState();
}

class _SettingViewState extends State<SettingView> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() => context.read<SettingCubit>());
  }

  @override
  Widget build(BuildContext context) {
    return ColoredStatusBar.primary(
      brightness: Brightness.dark,
      child: Scaffold(
        appBar: SkyAppBar.secondary(title: 'txt_setting'.tr()),
        bottomNavigationBar: Padding(
          padding: EdgeInsets.fromLTRB(
            24,
            12,
            24,
            MediaQuery.paddingOf(context).bottom + 12,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                '${'txt_version'.tr()} ${AppConfiguration.appVersion}',
                style: AppStyle.body2.copyWith(color: Colors.grey),
              ),
              const SizedBox(height: 12),
              SkyButton(
                onPressed: () {
                  context.read<SettingCubit>().onLogout(context);
                },
                text: 'txt_logout'.tr(),
              ),
            ],
          ),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(child: Text('txt_language'.tr())),
                  Flexible(
                    child: BlocBuilder<SettingCubit, SettingState>(
                      builder: (context, state) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            const Text('ENG'),
                            Radio(
                              value: 'en',
                              groupValue: state.languageCode,
                              onChanged: (value) {
                                context.read<SettingCubit>().onUpdateLocale(
                                      context: context,
                                      languageCode: value.toString(),
                                    );
                              },
                            ),
                            const Text('ID'),
                            Radio(
                              value: 'id',
                              groupValue: state.languageCode,
                              onChanged: (value) async {
                                context.read<SettingCubit>().onUpdateLocale(
                                      context: context,
                                      languageCode: value.toString(),
                                    );
                              },
                            ),
                          ],
                        );
                      },
                    ),
                  )
                ],
              ),
              const Divider(color: Colors.grey),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('txt_dark_mode'.tr()),
                  BlocBuilder<ThemeManager, ThemeState>(
                    builder: (context, state) => Switch(
                      value: state is IsDarkMode,
                      onChanged: (value) {
                        context.read<ThemeManager>().changeTheme();
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skybase/config/auth_manager/auth_manager.dart';
import 'package:skybase/core/helper/dialog_helper.dart';
import 'package:skybase/core/localization/locale_manager.dart';
import 'package:skybase/core/database/storage/storage_key.dart';
import 'package:skybase/core/database/storage/storage_manager.dart';

part 'setting_state.dart';

class SettingCubit extends Cubit<SettingState> {
  String tag = 'SettingCubit::->';

  SettingCubit()
      : super(
            SettingState(LocaleManager.instance.getCurrentLocale.languageCode)) {
    setLocale();
  }

  void setLocale() {
    Locale currentLocale = LocaleManager.instance.getCurrentLocale;
    emit(SettingState(currentLocale.languageCode));
  }

  void onUpdateLocale({
    required BuildContext context,
    required String languageCode,
  }) async {
    StorageManager.instance
        .save<String>(StorageKey.CURRENT_LOCALE, languageCode);
    LocaleManager.instance.updateLocale(context, Locale(languageCode));
    emit(SettingState(languageCode));
  }

  void onLogout(BuildContext context) async {
    LoadingDialog.show(context);
    AuthManager.instance.logout();
  }
}

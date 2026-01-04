/* Created by
   Varcant
   nanda.kista@gmail.com
*/

import 'package:easy_localization/easy_localization.dart';

mixin ApiMessage {

  /// Convert message from BE
  ///
  /// **Example:**
  /// Be message = User not found, will be translated to *txt_api_user_not_found.tr*
  String convertMessage(String errorMessage) {
    return switch (errorMessage) {
      'User not found' => 'txt_api_user_not_found'.tr(),
    // Add other..
    // ...
      _ => errorMessage,
    };
  }
}

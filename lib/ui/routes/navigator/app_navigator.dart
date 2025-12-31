import 'package:skybase/service_locator.dart';

AppNavigator get navigator => sl<AppNavigator>();

abstract class AppNavigator {
  Future<T?> push<T>(
    String path, {
    Object? arguments,
    Map<String, String> pathParameters = const <String, String>{},
  });

  Future<T?> pushReplacement<T>(
    String path, {
    Object? arguments,
    Map<String, String> pathParameters = const <String, String>{},
  });

  Future<T?> pushAllReplacement<T extends Object?>(
    String path, {
    Object? arguments,
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, dynamic> queryParameters = const <String, dynamic>{},
  });

  void pop<T extends Object?>({T? result});

  void popMultiple<T extends Object?>({int? times, T? result});

  void popUntil(String path, {Object? arguments});

  Future<T?> popUntilAndPush<T>(
    String path,
    String predicatePath, {
    Object? arguments,
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, dynamic> queryParameters = const <String, dynamic>{},
  });
}

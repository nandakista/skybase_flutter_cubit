import 'package:go_router/go_router.dart';

import 'app_navigator.dart';

class GoRouterNavigator implements AppNavigator {
  final GoRouter router;

  GoRouterNavigator(this.router);

  @override
  void pop<T extends Object?>({T? result}) {
    router.pop(result);
  }

  @override
  void popMultiple<T extends Object?>({int? times, T? result}) {
    if (times != null && times >= 1) {
      for (int i = 1; i < times; i++) {
        if (router.canPop()) router.pop(result);
      }
    }
  }

  @override
  void popUntil(String path, {Object? arguments}) {
    final routerDelegate = router.routerDelegate;
    final configuration = routerDelegate.currentConfiguration;

    while (router.canPop() && configuration.last.route.name != path) {
      router.pop();
    }
  }

  @override
  Future<T?> popUntilAndPush<T>(
    String path,
    String predicatePath, {
    Object? arguments,
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, dynamic> queryParameters = const <String, dynamic>{},
  }) {
    final routerDelegate = router.routerDelegate;
    final configuration = routerDelegate.currentConfiguration;
    while (router.canPop() && configuration.last.route.name != predicatePath) {
      router.pop();
    }

    return router.pushNamed(
      path,
      extra: arguments,
      queryParameters: queryParameters,
      pathParameters: pathParameters,
    );
  }

  @override
  Future<T?> push<T>(
    String path, {
    Object? arguments,
    Map<String, String> pathParameters = const <String, String>{},
  }) {
    return router.pushNamed<T>(
      path,
      extra: arguments,
      pathParameters: pathParameters,
    );
  }

  @override
  Future<T?> pushAllReplacement<T extends Object?>(
    String path, {
    Object? arguments,
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, dynamic> queryParameters = const <String, dynamic>{},
  }) {
    while (router.canPop()) {
      router.pop();
    }
    return router.pushReplacementNamed(
      path,
      extra: arguments,
      queryParameters: queryParameters,
      pathParameters: pathParameters,
    );
  }

  @override
  Future<T?> pushReplacement<T>(
    String path, {
    Object? arguments,
    Map<String, String> pathParameters = const <String, String>{},
  }) {
    return router.pushReplacementNamed<T>(
      path,
      extra: arguments,
      pathParameters: pathParameters,
    );
  }
}

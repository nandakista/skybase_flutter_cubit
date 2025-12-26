/* Created by
   Varcant
   nanda.kista@gmail.com
*/

import 'dart:async';
import 'dart:developer';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/foundation.dart';

mixin ConnectivityMixin {
  StreamSubscription<List<ConnectivityResult>>? streamConnectivity;
  final Connectivity connectivity = Connectivity();

  /// **Note:**
  /// Call this method in [onInit] to activate auto retry request.
  /// When network connection is reconnect, this method automatically call [onRefresh]
  void listenConnectivity(VoidCallback onRefresh) {
    try {
      streamConnectivity = connectivity.onConnectivityChanged.listen(
        (connection) {
          if (connection.contains(ConnectivityResult.none)) {
            log('Connectivity: Disconnect from internet $connection');
          } else {
            log('Connectivity: Connect to $connection');
            onRefresh();
          }
        },
      );
    } catch (e, stackTrace) {
      log('Failed stream connectivity :', error: e, stackTrace: stackTrace);
    }
  }

  /// **Note:**
  /// Call this in onDispose or onClose to prevent memory leak
  void cancelConnectivity() {
    streamConnectivity?.cancel();
  }
}

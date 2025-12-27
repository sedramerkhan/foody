import 'package:connectivity_plus/connectivity_plus.dart';

/// Utility class for checking network connectivity
class ConnectionInfo {
  /// Checks if the device is currently connected to the internet.
  ///
  /// Returns `true` if connected via WiFi or mobile data, `false` otherwise.
  static Future<bool> isConnected() async {
    final connectivityResult = await Connectivity().checkConnectivity();
    return connectivityResult.contains(ConnectivityResult.wifi) ||
        connectivityResult.contains(ConnectivityResult.mobile);
  }
}

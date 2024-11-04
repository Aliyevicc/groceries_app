import 'package:connectivity_plus/connectivity_plus.dart';

class ConnectionChecker {

  Future<List<ConnectivityResult>> getConnectionType() async {
    return await Connectivity().checkConnectivity();
  }

  Future<bool> hasInternetConnection() async {
    ConnectivityResult result = (await getConnectionType()) as ConnectivityResult;

    if (result == ConnectivityResult.mobile) {

      return true;
    } else if (result == ConnectivityResult.wifi) {

      return true;
    } else if (result == ConnectivityResult.ethernet) {

      return true;
    } else {
      return false;
    }
  }
}

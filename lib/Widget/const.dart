import 'package:connectivity/connectivity.dart';
import 'package:pedrodap/Model/UserModal.dart';



Future<bool> checkInternet() async {
  var connectivityResult = await (Connectivity().checkConnectivity());
  if (connectivityResult == ConnectivityResult.mobile) {
    return true;
  } else if (connectivityResult == ConnectivityResult.wifi) {
    return true;
  }
  return false;
}
UserModal? userData;
const String baseUrl = 'https://footbal.fableadtechnolabs.com/api/ajax.php';


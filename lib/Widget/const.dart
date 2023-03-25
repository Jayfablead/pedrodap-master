import 'package:connectivity/connectivity.dart';
import 'package:pedrodap/Model/UserModal.dart';
import 'package:pedrodap/Model/allplayersmodal.dart';
import 'package:pedrodap/Model/fitnessmodal.dart';
import 'package:pedrodap/Model/nutrimodal.dart';
import 'package:pedrodap/Model/playermodal.dart';
import 'package:pedrodap/Model/profileModal.dart';
import 'package:pedrodap/Model/relymodal.dart';
import 'package:pedrodap/Model/sleepmodal.dart';
import 'package:pedrodap/Model/userprofileModal.dart';
import 'package:pedrodap/Model/viewtodoModal.dart';

import '../Model/fetchplayermodal.dart';
import '../Model/trainingsModal.dart';

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
Playermodal? playerdata;
ProfileModal? profiledata;
AllplayersModal? alldata;
Userprofilemodal? userprofile;
TrainingModal? alltrainings;
FitnessModal? allfitness;
NutritionModal? allnutri;
SleepModal? allsleep;
ViewtodoModal? alltodo;
ReplyModal? viewreply;

Fetchplayermodal? fetchplayermodal;
const String baseUrl = 'https://footbal.fableadtechnolabs.com/api/ajax.php';

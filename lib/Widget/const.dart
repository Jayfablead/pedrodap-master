import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:pedrodap/Model/FitreplyModal.dart';
import 'package:pedrodap/Model/ReqModal.dart';
import 'package:pedrodap/Model/UserModal.dart';
import 'package:pedrodap/Model/allplayersmodal.dart';
import 'package:pedrodap/Model/feedimagesmodal.dart';
import 'package:pedrodap/Model/fitnessmodal.dart';
import 'package:pedrodap/Model/fittodoModal.dart';
import 'package:pedrodap/Model/nutrimodal.dart';
import 'package:pedrodap/Model/nutrireplyModal.dart';
import 'package:pedrodap/Model/nutritodoModal.dart';
import 'package:pedrodap/Model/playermodal.dart';
import 'package:pedrodap/Model/profileModal.dart';
import 'package:pedrodap/Model/relymodal.dart';
import 'package:pedrodap/Model/searchnutriModal.dart';
import 'package:pedrodap/Model/searchtodoModal.dart';
import 'package:pedrodap/Model/searchtodonutri.dart';
import 'package:pedrodap/Model/searchtrainmodal.dart';
import 'package:pedrodap/Model/sleepmodal.dart';
import 'package:pedrodap/Model/userprofileModal.dart';
import 'package:pedrodap/Model/viewtodoModal.dart';

import '../Model/Viewmsgmodal.dart';
import '../Model/chatmodal.dart';
import '../Model/clubidmodal.dart';
import '../Model/connectedModal.dart';
import '../Model/feedvidmodal.dart';
import '../Model/fetchplayermodal.dart';
import '../Model/filtermodal.dart';
import '../Model/pendingreqModal.dart';
import '../Model/searchchatModal.dart';
import '../Model/searchfittModal.dart';
import '../Model/searchfittodoModal.dart';
import '../Model/searchusersmodal.dart';
import '../Model/sleepsearchmodal.dart';
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
FitalltodoModal? fittodoall;
FitreplyModal? fitviewreply;
SearchtrainModal? searchtraining;
SearchtodoModal? searchtodotraining;
NutriallreplyModal? nutriviewreply;
NutritodoModal? nutrialltodo;
SearchfitModal? searchfitness;
SearchfittodoModal? searchfittodo;
SearchNutModal? searchnutri;
Fetchplayermodal? fetchplayermodal;
NutritodosearchModal? searchtodonutri;
SleepsearchModal? searchsleep;
PendingreqModal? pending;
ConnectedModal? connections;
chatPageModal? allchats;
SearchchatModal? searchchat;
ViewchatmsgModal? viewmsgs;
searchUsersModal? searchuser;
ReqModal? reqsts;
Clubidmodal? cludid;
FeedImagesModal? feedimages;
feedVidsModal? feedvid;
Filtermodal? filter;

const String baseUrl = 'https://footbal.fableadtechnolabs.com/api/ajax.php';

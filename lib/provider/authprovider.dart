import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pedrodap/Widget/CustomExpection.dart';
import 'package:pedrodap/Widget/const.dart';
import 'package:pedrodap/Widget/response.dart';

class authprovider with ChangeNotifier {
  Map<String, String> headers = {
    'Authorization': 'hXuRUGsEGuhGf6KG',
  };
  Map<String, String> headersinsta = {
    "X-RapidAPI-Host": "check-username.p.rapidapi.com",
    "X-RapidAPI-Key": "4856922f7amsh29f7b2e7e9419e2p1ee023jsn2119665d7ff8"
  };

  Future<http.Response> signupapi(Map<String, String> bodyData) async {
    const url = '$baseUrl/?action=signup_app';
    var responseJson;
    final response = await http
        .post(Uri.parse(url), body: bodyData, headers: headers)
        .timeout(
      const Duration(seconds: 30),
      onTimeout: () {
        throw const SocketException('Something went wrong');
      },
    );
    responseJson = responses(response);
    return responseJson;
  }

  Future<http.Response> loginapi(Map<String, String> bodyData) async {
    const url = '$baseUrl/?action=login_app';
    var responseJson;
    final response = await http
        .post(Uri.parse(url), body: bodyData, headers: headers)
        .timeout(
      const Duration(seconds: 30),
      onTimeout: () {
        throw const SocketException('Something went wrong');
      },
    );
    responseJson = responses(response);
    return responseJson;
  }

  Future<http.Response> feedimgapi(Map<String, String> bodyData) async {
    const url = '$baseUrl/?action=feedPageApp';
    var responseJson;
    final response = await http
        .post(Uri.parse(url), body: bodyData, headers: headers)
        .timeout(
      const Duration(seconds: 30),
      onTimeout: () {
        throw const SocketException('Something went wrong');
      },
    );
    responseJson = responses(response);
    return responseJson;
  }
  Future<http.Response> feedvidapi(Map<String, String> bodyData) async {
    const url = '$baseUrl/?action=feedVideoPageApp';
    var responseJson;
    final response = await http
        .post(Uri.parse(url), body: bodyData, headers: headers)
        .timeout(
      const Duration(seconds: 30),
      onTimeout: () {
        throw const SocketException('Something went wrong');
      },
    );
    responseJson = responses(response);
    return responseJson;
  }

  Future<http.Response> clubsnameapi(Map<String, String> bodyData) async {
    const url = '$baseUrl/?action=all_clubs_for_signup';
    var responseJson;
    final response = await http
        .post(Uri.parse(url), body: bodyData, headers: headers)
        .timeout(
      const Duration(seconds: 30),
      onTimeout: () {
        throw const SocketException('Something went wrong');
      },
    );
    responseJson = responses(response);
    return responseJson;
  }

  Future<http.Response> playersApi(Map<String, String> bodyData) async {
    const url = '$baseUrl/?action=all_players_app';
    var responseJson;
    final response = await http
        .post(Uri.parse(url), body: bodyData, headers: headers)
        .timeout(
      const Duration(seconds: 30),
      onTimeout: () {
        throw const SocketException('Something went wrong');
      },
    );
    responseJson = responses(response);
    return responseJson;
  }

  Future<http.Response> fetchplayersApi(Map<String, String> bodyData) async {
    const url = '$baseUrl/?action=players_view_details_app';
    var responseJson;
    final response = await http
        .post(Uri.parse(url), body: bodyData, headers: headers)
        .timeout(
      const Duration(seconds: 30),
      onTimeout: () {
        throw const SocketException('Something went wrong');
      },
    );
    responseJson = responses(response);
    return responseJson;
  }

  Future<http.Response> profileapi(Map<String, String> bodyData) async {
    const url = '$baseUrl/?action=view_profile_details';
    var responseJson;
    final response = await http
        .post(Uri.parse(url), body: bodyData, headers: headers)
        .timeout(
      const Duration(seconds: 30),
      onTimeout: () {
        throw const SocketException('Something went wrong');
      },
    );
    responseJson = responses(response);
    return responseJson;
  }

  Future<http.Response> chatpageapi(Map<String, String> bodyData) async {
    const url = '$baseUrl/?action=messages_list_app';
    var responseJson;
    final response = await http
        .post(Uri.parse(url), body: bodyData, headers: headers)
        .timeout(
      const Duration(seconds: 30),
      onTimeout: () {
        throw const SocketException('Something went wrong');
      },
    );
    responseJson = responses(response);
    return responseJson;
  }

  Future<http.Response> allplayersapi(Map<String, String> bodyData) async {
    const url = '$baseUrl/?action=all_users_app';
    var responseJson;
    final response = await http
        .post(Uri.parse(url), body: bodyData, headers: headers)
        .timeout(
      const Duration(seconds: 30),
      onTimeout: () {
        throw const SocketException('Something went wrong');
      },
    );
    responseJson = responses(response);
    return responseJson;
  }

  Future<http.Response> sendreqapi(Map<String, String> bodyData) async {
    const url = '$baseUrl/?action=create_connection_request';
    var responseJson;
    final response = await http
        .post(Uri.parse(url), body: bodyData, headers: headers)
        .timeout(
      const Duration(seconds: 30),
      onTimeout: () {
        throw const SocketException('Something went wrong');
      },
    );
    responseJson = responses(response);
    return responseJson;
  }

  Future<http.Response> userprofapi(Map<String, String> bodyData) async {
    const url = '$baseUrl/?action=users_profile_details_app';
    var responseJson;
    final response = await http
        .post(Uri.parse(url), body: bodyData, headers: headers)
        .timeout(
      const Duration(seconds: 30),
      onTimeout: () {
        throw const SocketException('Something went wrong');
      },
    );
    responseJson = responses(response);
    return responseJson;
  }

  Future<http.Response> trainingapi(Map<String, String> bodyData) async {
    const url = '$baseUrl/?action=all_trainings_and_notes_app';
    var responseJson;
    final response = await http
        .post(Uri.parse(url), body: bodyData, headers: headers)
        .timeout(
      const Duration(seconds: 30),
      onTimeout: () {
        throw const SocketException('Something went wrong');
      },
    );
    responseJson = responses(response);

    return responseJson;
  }

  Future<http.Response> fitnessapi(Map<String, String> bodyData) async {
    const url = '$baseUrl/?action=all_fitness_programmes_details_app';
    var responseJson;
    final response = await http
        .post(Uri.parse(url), body: bodyData, headers: headers)
        .timeout(
      const Duration(seconds: 30),
      onTimeout: () {
        throw const SocketException('Something went wrong');
      },
    );
    responseJson = responses(response);

    return responseJson;
  }

  Future<http.Response> nutriapi(Map<String, String> bodyData) async {
    const url = '$baseUrl/?action=all_nutrition_and_health_details_app';
    var responseJson;
    final response = await http
        .post(Uri.parse(url), body: bodyData, headers: headers)
        .timeout(
      const Duration(seconds: 30),
      onTimeout: () {
        throw const SocketException('Something went wrong');
      },
    );
    responseJson = responses(response);

    return responseJson;
  }

  Future<http.Response> sleepapi(Map<String, String> bodyData) async {
    const url = '$baseUrl/?action=sleep_schedule_details_app';
    var responseJson;
    final response = await http
        .post(Uri.parse(url), body: bodyData, headers: headers)
        .timeout(
      const Duration(seconds: 30),
      onTimeout: () {
        throw const SocketException('Something went wrong');
      },
    );
    responseJson = responses(response);

    return responseJson;
  }

  Future<http.Response> addsleepapi(Map<String, String> bodyData) async {
    const url = '$baseUrl/?action=add_sleep_schedule_app';
    var responseJson;
    final response = await http
        .post(Uri.parse(url), body: bodyData, headers: headers)
        .timeout(
      const Duration(seconds: 30),
      onTimeout: () {
        throw const SocketException('Something went wrong');
      },
    );
    responseJson = responses(response);

    return responseJson;
  }

  Future<http.Response> addtraintodoapi(Map<String, String> bodyData) async {
    const url = '$baseUrl/?action=add_to_do_tr_n_notes_app';
    var responseJson;
    final response = await http
        .post(Uri.parse(url), body: bodyData, headers: headers)
        .timeout(
      const Duration(seconds: 30),
      onTimeout: () {
        throw const SocketException('Something went wrong');
      },
    );
    responseJson = responses(response);

    return responseJson;
  }

  Future<http.Response> viewtraintodoapi(Map<String, String> bodyData) async {
    const url = '$baseUrl/?action=to_do_trainings_app';
    var responseJson;
    final response = await http
        .post(Uri.parse(url), body: bodyData, headers: headers)
        .timeout(
      const Duration(seconds: 30),
      onTimeout: () {
        throw const SocketException('Something went wrong');
      },
    );
    responseJson = responses(response);

    return responseJson;
  }

  Future<http.Response> deletetodo(Map<String, String> bodyData) async {
    const url = '$baseUrl/?action=to_do_delete';
    var responseJson;
    final response = await http
        .post(Uri.parse(url), body: bodyData, headers: headers)
        .timeout(
      const Duration(seconds: 30),
      onTimeout: () {
        throw const SocketException('Something went wrong');
      },
    );
    responseJson = responses(response);

    return responseJson;
  }

  Future<http.Response> Completeapi(Map<String, String> bodyData) async {
    const url = '$baseUrl/?action=to_do_is_completed';
    var responseJson;
    final response = await http
        .post(Uri.parse(url), body: bodyData, headers: headers)
        .timeout(
      const Duration(seconds: 30),
      onTimeout: () {
        throw const SocketException('Something went wrong');
      },
    );
    responseJson = responses(response);

    return responseJson;
  }

  Future<http.Response> NutriCompleteapi(Map<String, String> bodyData) async {
    const url = '$baseUrl/?action=nutrition_and_health_to_do_is_completed';
    var responseJson;
    final response = await http
        .post(Uri.parse(url), body: bodyData, headers: headers)
        .timeout(
      const Duration(seconds: 30),
      onTimeout: () {
        throw const SocketException('Something went wrong');
      },
    );
    responseJson = responses(response);

    return responseJson;
  }

  Future<http.Response> Incompleteapi(Map<String, String> bodyData) async {
    const url = '$baseUrl/?action=to_do_is_incomplete';
    var responseJson;
    final response = await http
        .post(Uri.parse(url), body: bodyData, headers: headers)
        .timeout(
      const Duration(seconds: 30),
      onTimeout: () {
        throw const SocketException('Something went wrong');
      },
    );
    responseJson = responses(response);

    return responseJson;
  }

  Future<http.Response> replyapi(Map<String, String> bodyData) async {
    const url = '$baseUrl/?action=sent_replies_trainings_app';
    var responseJson;
    final response = await http
        .post(Uri.parse(url), body: bodyData, headers: headers)
        .timeout(
      const Duration(seconds: 30),
      onTimeout: () {
        throw const SocketException('Something went wrong');
      },
    );
    responseJson = responses(response);

    return responseJson;
  }

  Future<http.Response> viewreplyapi(Map<String, String> bodyData) async {
    const url = '$baseUrl/?action=replies_trainings_app';
    var responseJson;
    final response = await http
        .post(Uri.parse(url), body: bodyData, headers: headers)
        .timeout(
      const Duration(seconds: 30),
      onTimeout: () {
        throw const SocketException('Something went wrong');
      },
    );
    responseJson = responses(response);

    return responseJson;
  }

  Future<http.Response> searchtrainapi(Map<String, String> bodyData) async {
    const url = '$baseUrl/?action=search_training_and_notes_app';
    var responseJson;
    final response = await http
        .post(Uri.parse(url), body: bodyData, headers: headers)
        .timeout(
      const Duration(seconds: 30),
      onTimeout: () {
        throw const SocketException('Something went wrong');
      },
    );
    responseJson = responses(response);

    return responseJson;
  }

  Future<http.Response> viewfittodoapi(Map<String, String> bodyData) async {
    const url = '$baseUrl/?action=to_do_fitness_programme_app';
    var responseJson;
    final response = await http
        .post(Uri.parse(url), body: bodyData, headers: headers)
        .timeout(
      const Duration(seconds: 30),
      onTimeout: () {
        throw const SocketException('Something went wrong');
      },
    );
    responseJson = responses(response);

    return responseJson;
  }

  Future<http.Response> fitviewreplyapi(Map<String, String> bodyData) async {
    const url = '$baseUrl/?action=replies_fitness_programme_app';
    var responseJson;
    final response = await http
        .post(Uri.parse(url), body: bodyData, headers: headers)
        .timeout(
      const Duration(seconds: 30),
      onTimeout: () {
        throw const SocketException('Something went wrong');
      },
    );
    responseJson = responses(response);

    return responseJson;
  }

  Future<http.Response> searchtodotrainapi(Map<String, String> bodyData) async {
    const url = '$baseUrl/?action=training_and_notes_to_do_search';
    var responseJson;
    final response = await http
        .post(Uri.parse(url), body: bodyData, headers: headers)
        .timeout(
      const Duration(seconds: 30),
      onTimeout: () {
        throw const SocketException('Something went wrong');
      },
    );
    responseJson = responses(response);

    return responseJson;
  }

  Future<http.Response> searchuserapi(Map<String, String> bodyData) async {
    const url = '$baseUrl/?action=search_users_app';
    var responseJson;
    final response = await http
        .post(Uri.parse(url), body: bodyData, headers: headers)
        .timeout(
      const Duration(seconds: 30),
      onTimeout: () {
        throw const SocketException('Something went wrong');
      },
    );
    responseJson = responses(response);

    return responseJson;
  }

  Future<http.Response> viewallnutrireplyapi(
      Map<String, String> bodyData) async {
    const url = '$baseUrl/?action=replies_nutrition_and_health_app';
    var responseJson;
    final response = await http
        .post(Uri.parse(url), body: bodyData, headers: headers)
        .timeout(
      const Duration(seconds: 30),
      onTimeout: () {
        throw const SocketException('Something went wrong');
      },
    );
    responseJson = responses(response);

    return responseJson;
  }

  Future<http.Response> addnutritodo(Map<String, String> bodyData) async {
    const url = '$baseUrl/?action=add_to_do_nutrition_and_health_app';
    var responseJson;
    final response = await http
        .post(Uri.parse(url), body: bodyData, headers: headers)
        .timeout(
      const Duration(seconds: 30),
      onTimeout: () {
        throw const SocketException('Something went wrong');
      },
    );
    responseJson = responses(response);

    return responseJson;
  }

  Future<http.Response> viewnutritodo(Map<String, String> bodyData) async {
    const url = '$baseUrl/?action=to_do_nutrition_and_health_app';
    var responseJson;
    final response = await http
        .post(Uri.parse(url), body: bodyData, headers: headers)
        .timeout(
      const Duration(seconds: 30),
      onTimeout: () {
        throw const SocketException('Something went wrong');
      },
    );
    responseJson = responses(response);

    return responseJson;
  }

  Future<http.Response> nutritodoincomplete(
      Map<String, String> bodyData) async {
    const url = '$baseUrl/?action=nutrition_and_health_to_do_is_incomplete';
    var responseJson;
    final response = await http
        .post(Uri.parse(url), body: bodyData, headers: headers)
        .timeout(
      const Duration(seconds: 30),
      onTimeout: () {
        throw const SocketException('Something went wrong');
      },
    );
    responseJson = responses(response);

    return responseJson;
  }

  Future<http.Response> SearchFitnessapi(Map<String, String> bodyData) async {
    const url = '$baseUrl/?action=search_fitness_programme_app';
    var responseJson;
    final response = await http
        .post(Uri.parse(url), body: bodyData, headers: headers)
        .timeout(
      const Duration(seconds: 30),
      onTimeout: () {
        throw const SocketException('Something went wrong');
      },
    );
    responseJson = responses(response);

    return responseJson;
  }

  Future<http.Response> Searchsleepapi(Map<String, String> bodyData) async {
    const url = '$baseUrl/?action=sleep_schedule_search_app';
    var responseJson;
    final response = await http
        .post(Uri.parse(url), body: bodyData, headers: headers)
        .timeout(
      const Duration(seconds: 30),
      onTimeout: () {
        throw const SocketException('Something went wrong');
      },
    );
    responseJson = responses(response);

    return responseJson;
  }

  Future<http.Response> SearchFitnesstodoapi(
      Map<String, String> bodyData) async {
    const url = '$baseUrl/?action=fitness_programme_to_do_search';
    var responseJson;
    final response = await http
        .post(Uri.parse(url), body: bodyData, headers: headers)
        .timeout(
      const Duration(seconds: 30),
      onTimeout: () {
        throw const SocketException('Something went wrong');
      },
    );
    responseJson = responses(response);

    return responseJson;
  }

  Future<http.Response> SearchNutriapi(Map<String, String> bodyData) async {
    const url = '$baseUrl/?action=search_nutrition_and_health_app';
    var responseJson;
    final response = await http
        .post(Uri.parse(url), body: bodyData, headers: headers)
        .timeout(
      const Duration(seconds: 30),
      onTimeout: () {
        throw const SocketException('Something went wrong');
      },
    );
    responseJson = responses(response);

    return responseJson;
  }

  Future<http.Response> SearchNutritodoapi(Map<String, String> bodyData) async {
    const url = '$baseUrl/?action=nutrition_and_health_to_do_search';
    var responseJson;
    final response = await http
        .post(Uri.parse(url), body: bodyData, headers: headers)
        .timeout(
      const Duration(seconds: 30),
      onTimeout: () {
        throw const SocketException('Something went wrong');
      },
    );
    responseJson = responses(response);

    return responseJson;
  }

  Future<http.Response> updateprofileapi(Map<String, String> bodyData) async {
    const url = '$baseUrl/?action=update_profile_app';
    var responseJson;
    try {
      final imageUploadRequest = http.MultipartRequest('POST', Uri.parse(url));
      imageUploadRequest.headers.addAll(headers);

      if (bodyData['video']?.isNotEmpty ?? false) {
        imageUploadRequest.files.add(await http.MultipartFile.fromPath(
            'video', bodyData['video'] ?? ''));
      }
      if (bodyData['images[]']?.isNotEmpty ?? false) {
        imageUploadRequest.files.add(await http.MultipartFile.fromPath(
            'images[]', bodyData['images[]'] ?? ''));
      }
      if (bodyData['profile_image']?.isNotEmpty ?? false) {
        imageUploadRequest.files.add(await http.MultipartFile.fromPath(
            'profile_image', bodyData['profile_image'] ?? ''));
      }
      imageUploadRequest.fields.addAll(bodyData);
      final streamResponse = await imageUploadRequest.send();

      responseJson = responses(await http.Response.fromStream(streamResponse));
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }

  Future<http.Response> deletephotoapi(Map<String, String> bodyData) async {
    print(bodyData['profile_image']);
    const url = '$baseUrl/?action=delete_images';
    var responseJson;
    final response = await http
        .post(Uri.parse(url), body: bodyData, headers: headers)
        .timeout(
      const Duration(seconds: 30),
      onTimeout: () {
        throw const SocketException('Something went wrong');
      },
    );
    responseJson = responses(response);

    return responseJson;
  }

  Future<http.Response> delevideoapi(Map<String, String> bodyData) async {
    print(bodyData['delete_video']);
    const url = '$baseUrl/?action=delete_video';
    var responseJson;
    final response = await http
        .post(Uri.parse(url), body: bodyData, headers: headers)
        .timeout(
      const Duration(seconds: 30),
      onTimeout: () {
        throw const SocketException('Something went wrong');
      },
    );
    responseJson = responses(response);

    return responseJson;
  }

  Future<http.Response> Changepassapi(Map<String, String> bodyData) async {
    const url = '$baseUrl/?action=change_password_app';
    var responseJson;
    final response = await http
        .post(Uri.parse(url), body: bodyData, headers: headers)
        .timeout(
      const Duration(seconds: 30),
      onTimeout: () {
        throw const SocketException('Something went wrong');
      },
    );
    responseJson = responses(response);

    return responseJson;
  }

  Future<http.Response> pendingreqapi(Map<String, String> bodyData) async {
    const url = '$baseUrl/?action=pending_request_app';
    var responseJson;
    final response = await http
        .post(Uri.parse(url), body: bodyData, headers: headers)
        .timeout(
      const Duration(seconds: 30),
      onTimeout: () {
        throw const SocketException('Something went wrong');
      },
    );
    responseJson = responses(response);

    return responseJson;
  }

  Future<http.Response> allreqstuserapi(Map<String, String> bodyData) async {
    const url = '$baseUrl/?action=all_requested_users';
    var responseJson;
    final response = await http
        .post(Uri.parse(url), body: bodyData, headers: headers)
        .timeout(
      const Duration(seconds: 30),
      onTimeout: () {
        throw const SocketException('Something went wrong');
      },
    );
    responseJson = responses(response);

    return responseJson;
  }

  Future<http.Response> acceptreqapi(Map<String, String> bodyData) async {
    const url = '$baseUrl/?action=accept_request_app';
    var responseJson;
    final response = await http
        .post(Uri.parse(url), body: bodyData, headers: headers)
        .timeout(
      const Duration(seconds: 30),
      onTimeout: () {
        throw const SocketException('Something went wrong');
      },
    );
    responseJson = responses(response);

    return responseJson;
  }

  Future<http.Response> unfriendapi(Map<String, String> bodyData) async {
    const url = '$baseUrl/?action=disconnect_user';
    var responseJson;
    final response = await http
        .post(Uri.parse(url), body: bodyData, headers: headers)
        .timeout(
      const Duration(seconds: 30),
      onTimeout: () {
        throw const SocketException('Something went wrong');
      },
    );
    responseJson = responses(response);

    return responseJson;
  }

  Future<http.Response> rejectreqapi(Map<String, String> bodyData) async {
    const url = '$baseUrl/?action=reject_request_app';
    var responseJson;
    final response = await http
        .post(Uri.parse(url), body: bodyData, headers: headers)
        .timeout(
      const Duration(seconds: 30),
      onTimeout: () {
        throw const SocketException('Something went wrong');
      },
    );
    responseJson = responses(response);

    return responseJson;
  }

  Future<http.Response> Connectionsapi(Map<String, String> bodyData) async {
    const url = '$baseUrl/?action=connected_users';
    var responseJson;
    final response = await http
        .post(Uri.parse(url), body: bodyData, headers: headers)
        .timeout(
      const Duration(seconds: 30),
      onTimeout: () {
        throw const SocketException('Something went wrong');
      },
    );
    responseJson = responses(response);

    return responseJson;
  }

  Future<http.Response> Showchatapi(Map<String, String> bodyData) async {
    const url = '$baseUrl/?action=chat_messages_app';
    var responseJson;
    final response = await http
        .post(Uri.parse(url), body: bodyData, headers: headers)
        .timeout(
      const Duration(seconds: 30),
      onTimeout: () {
        throw const SocketException('Something went wrong');
      },
    );
    responseJson = responses(response);

    return responseJson;
  }

  Future<http.Response> Sendchatapi(Map<String, String> bodyData) async {
    const url = '$baseUrl/?action=send_message_app';
    var responseJson;
    if (bodyData['type'] == "1") {
      final response = await http
          .post(Uri.parse(url), body: bodyData, headers: headers)
          .timeout(
        const Duration(seconds: 30),
        onTimeout: () {
          throw const SocketException('Something went wrong');
        },
      );
      responseJson = responses(response);
      return responseJson;
    } else {
      try {
        final imageUploadRequest =
            http.MultipartRequest('POST', Uri.parse(url));
        imageUploadRequest.headers.addAll(headers);
        if (bodyData['message']?.isNotEmpty ?? false) {
          final file = await http.MultipartFile.fromPath(
              'message', bodyData['message'] ?? '');
          imageUploadRequest.files.add(file);
        }

        imageUploadRequest.fields.addAll(bodyData);
        final streamResponse = await imageUploadRequest.send();

        responseJson =
            responses(await http.Response.fromStream(streamResponse));
      } on SocketException {
        throw FetchDataException('No Internet connection');
      }
      return responseJson;
    }
  }

  Future<http.Response> Searchchatapi(Map<String, String> bodyData) async {
    const url = '$baseUrl/?action=search_messages';
    var responseJson;
    final response = await http
        .post(Uri.parse(url), body: bodyData, headers: headers)
        .timeout(
      const Duration(seconds: 30),
      onTimeout: () {
        throw const SocketException('Something went wrong');
      },
    );
    responseJson = responses(response);

    return responseJson;
  }

  Future<http.Response> addtrainingapi(Map<String, String> bodyData) async {
    const url = '$baseUrl/?action=add_training_and_notesdt';
    var responseJson;
    final response = await http
        .post(Uri.parse(url), body: bodyData, headers: headers)
        .timeout(
      const Duration(seconds: 30),
      onTimeout: () {
        throw const SocketException('Something went wrong');
      },
    );
    responseJson = responses(response);

    return responseJson;
  }

  Future<http.Response> addfitnessapi(Map<String, String> bodyData) async {
    const url = '$baseUrl/?action=add_fitness_programmedt';
    var responseJson;
    final response = await http
        .post(Uri.parse(url), body: bodyData, headers: headers)
        .timeout(
      const Duration(seconds: 30),
      onTimeout: () {
        throw const SocketException('Something went wrong');
      },
    );
    responseJson = responses(response);

    return responseJson;
  }

  Future<http.Response> addnutriapi(Map<String, String> bodyData) async {
    const url = '$baseUrl/?action=add_nutrition_and_healthdt';
    var responseJson;
    final response = await http
        .post(Uri.parse(url), body: bodyData, headers: headers)
        .timeout(
      const Duration(seconds: 30),
      onTimeout: () {
        throw const SocketException('Something went wrong');
      },
    );
    responseJson = responses(response);

    return responseJson;
  }

  Future<http.Response> instauser(Map<String, String> bodyData) async {
    const url =
        'https://check-username.p.rapidapi.com/check/instagram/username';
    var responseJson;

    final response =
        await http.get(Uri.parse(url), headers: headersinsta).timeout(
      const Duration(seconds: 30),
      onTimeout: () {
        throw const SocketException('Something went wrong');
      },
    );
    responseJson = responses(response);

    return responseJson;
  }
}

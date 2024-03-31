import 'dart:convert';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dictionary/core/constants/constants.dart';
import 'package:dictionary/core/extensions/connectivity.dart';
import 'package:dictionary/core/models/dictionary_api_model.dart';
import 'package:dictionary/ui/widgets/dialog.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';

class VMDashboard extends ChangeNotifier {
  DictionaryApiModel _dictionaryApiModel = DictionaryApiModel();
  DictionaryApiModel? get dictionaryApiModel => _dictionaryApiModel;
  bool isBusy = false;
  List<String> types = [];

  Future<void> fetchResponse(BuildContext context, word) async {
    isBusy = true;
    notifyListeners();

    final ConnectivityResult connectivityResult =
        await (Connectivity().checkConnectivity());
    final Logger logger = Logger();

    if (connectivityResult.hasInternetConnection) {
      try {
        var response = await http.get(
          Uri.parse(ApiEndpoints.url(word)),
        );
        if (response.statusCode == 200) {
          var body = response.body.substring(1, response.body.length - 1);

          var parsed = json.decode(body);

          _dictionaryApiModel = DictionaryApiModel.fromJson(parsed);
        }
      } catch (e) {
        logger.e('Error! Something bad happened', error: e.toString());
      }
    } else {
      // ignore: use_build_context_synchronously
      getDialogNewtworkConnectionFailed(context);
    }
    isBusy = false;
    notifyListeners();
  }
}

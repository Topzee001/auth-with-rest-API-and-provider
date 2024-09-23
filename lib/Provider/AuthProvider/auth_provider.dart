import 'dart:convert';
import 'dart:io';

import 'package:auth_restapi_provider/Constants/url.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Authentication extends ChangeNotifier {
  ///base Url
  final requestBaseUrl = AppUrl.baseUrl;

  //setter
  bool _isLoading = false;
  String _resMessage = '';

  //gette
  bool get isLoading => _isLoading;
  String get resMessage => _resMessage;

//create constructor for what we're requesting for acct creation.
  void registerUser({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
    BuildContext? context,
  }) async {
    _isLoading = true;
    notifyListeners();

    String url = '$requestBaseUrl/users/';

    final body = {
      "firstName": firstName,
      "lastName": lastName,
      "email": email,
      "password": password,
    };
    print(body);

    try {
      // ask backend dev if decode is needed or not
      http.Response req =
          await http.post(Uri.parse(url), body: json.encode(body));

      if (req.statusCode == 200 || req.statusCode == 201) {
        final res = json.decode(req.body);
        print(res);
        _isLoading = false;
        _resMessage = 'Account created!';
      } else {
        final res = json.decode(req.body);

        print(res);
        _isLoading = false;
        notifyListeners();
      }
    } on SocketException catch (_) {
      _isLoading = false;
      _resMessage = "Internet connection is not available";
      notifyListeners();
    } catch (e) {
      _isLoading = false;
      _resMessage = "Please try again";
      notifyListeners();

      print("::::::: $e");
    }
  }
}

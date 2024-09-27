import 'dart:convert';
import 'dart:io';

import 'package:auth_restapi_provider/Constants/url.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class AuthenticationProvider extends ChangeNotifier {
  ///base Url
  final requestBaseUrl = AppUrl.baseUrl;

  //setter
  bool _isLoading = false;
  String _resMessage = '';

  //getter
  bool get isLoading => _isLoading;
  String get resMessage => _resMessage;

//create constructor for what we're requesting for acct creation.
  // void registerUser({
  //   required String firstName,
  //   required String lastName,
  //   required String email,
  //   required String password,
  //   BuildContext? context,
  // }) async {
  //   _isLoading = true;
  //   notifyListeners();

  //   String url = '$requestBaseUrl/users/';

  //   final body = {
  //     "firstName": firstName,
  //     "lastName": lastName,
  //     "email": email,
  //     "password": password,
  //   };
  //   print(body);

  //   try {
  //     // ask backend dev if decode is needed or not
  //     http.Response req =
  //         await http.post(Uri.parse(url), body: json.encode(body));

  //     if (req.statusCode == 200 || req.statusCode == 201) {
  //       final res = json.decode(req.body);
  //       print(res);
  //       _isLoading = false;
  //       _resMessage = "Account created!";
  //     } else {
  //       final res = json.decode(req.body);

  //       print(res);
  //       _isLoading = false;
  //       notifyListeners();
  //     }
  //   } on SocketException catch (_) {
  //     _isLoading = false;
  //     _resMessage = "Internet connection is not available";
  //     notifyListeners();
  //   } catch (e) {
  //     _isLoading = false;
  //     _resMessage = "Please try again";
  //     notifyListeners();

  //     print("::::::: $e");
  //   }
  // }

  // //login new user
  // void loginUser({
  //   required String email,
  //   required String password,
  //   BuildContext? context,
  // }) async {
  //   _isLoading = true;
  //   notifyListeners();

  //   //String url = "$requestBaseUrl/api/login";
  //   String url = "https://reqres.in/api/login";

  //   final body = {
  //     "email": email,
  //     "password": password,
  //   };
  //   print(body);
  //   print('Request URL: $url');
  //   print('Request Body: $body');

  //   try {
  //     // ask backend dev if decode is needed or not
  //     http.Response req =
  //         await http.post(Uri.parse(url), body: json.encode(body));
  //     print('Response Status Code: ${req.statusCode}');
  //     print('Response Body: ${req.body}');

  //     if (req.statusCode == 200 || req.statusCode == 201) {
  //       final res = json.decode(req.body);

  //       print(res);

  //       _isLoading = false;
  //       _resMessage = 'Login successful!';
  //       notifyListeners();
  //     } else {
  //       final res = json.decode(req.body);

  //       _resMessage =
  //           //res['error'] ?? 'An error occured';
  //           res['message'];

  //       print(res);
  //       _isLoading = false;
  //       notifyListeners();
  //     }
  //   } on SocketException catch (_) {
  //     _isLoading = false;
  //     _resMessage = "Internet connection is not available";
  //     notifyListeners();
  //   } catch (e) {
  //     _isLoading = false;
  //     _resMessage = "Please try again";
  //     notifyListeners();

  //     print("::::::: $e");
  //   }
  // }

  //alternative
  void registerUser({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
    BuildContext? context,
  }) async {
    _isLoading = true;
    notifyListeners();

    // String url = "https://reqres.in/api/register";
    String url = "http://52.201.161.111:5000/register";

    final body = {
      "firstName": firstName,
      "lastName": lastName,
      "email": email,
      "password": password,
    };
    print('Request URL: $url');
    print('Request Body: $body');

    try {
      Response response = await http.post(
        Uri.parse(url),
        headers: {"Content-Type": "application/json"},
        body: json.encode(body),
      );

      print('Response Status Code: ${response.statusCode}');
      print('Response Body: ${response.body}');

      if (response.statusCode == 200 || response.statusCode == 201) {
        try {
          final res = json.decode(response.body);
          print('Response Data: $res');
          _resMessage = 'Register successful!';
        } catch (e) {
          print('Error parsing JSON: $e');
          _resMessage = 'Invalid response format';
        }
      } else {
        try {
          final res = json.decode(response.body);
          //_resMessage = res['error'] ?? 'An error occurred';
          _resMessage = res['message'];
        } catch (e) {
          print('Error parsing error response: $e');
          _resMessage = 'An error occurred: ${response.statusCode}';
        }
      }
    } on SocketException {
      _resMessage = "Internet connection is not available";
    } catch (e) {
      _resMessage = "Please try again: $e";
      print("Error: $e");
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  void loginUser({
    required String email,
    required String password,
    BuildContext? context,
  }) async {
    _isLoading = true;
    notifyListeners();

    //String url = "https://reqres.in/api/login";
    String url = "http://52.201.161.111:5000/login";

    final body = {
      "email": email,
      "password": password,
    };
    print('Request URL: $url');
    print('Request Body: $body');

    try {
      Response response = await http.post(
        Uri.parse(url),
        headers: {"Content-Type": "application/json"},
        body: json.encode(body),
      );

      print('Response Status Code: ${response.statusCode}');
      print('Response Body: ${response.body}');

      if (response.statusCode == 200 || response.statusCode == 201) {
        try {
          final res = json.decode(response.body);
          print('Response Data: $res');
          _resMessage = 'Login successful!';
        } catch (e) {
          print('Error parsing JSON: $e');
          _resMessage = 'Invalid response format';
          //password
        }
      } else {
        try {
          final res = json.decode(response.body);
          _resMessage = res['error'] ?? 'An error occurred';
          // _resMessage = res['message'];
        } catch (e) {
          print('Error parsing error response: $e');
          _resMessage = 'An error occurred: ${response.statusCode}';
        }
      }
    } on SocketException {
      _resMessage = "Internet connection is not available";
    } catch (e) {
      _resMessage = "Please try again: $e";
      print("Error: $e");
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  void clear() {
    _resMessage = "";
    notifyListeners();
  }
}

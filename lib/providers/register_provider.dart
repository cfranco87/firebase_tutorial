import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:yellow_pages/models/user.dart';
//package for http

class RegisterProvider extends ChangeNotifier {
  String endpoint = 'https://identitytoolkit.googleapis.com/v1/';
  RegisterProvider() {
    print('initializing register_provider...');
  }

  //map (key:value) dictionaries
  Future<bool> registerUser(Map<String, String> formData) async {
    var url = Uri.parse(endpoint +
        'accounts:signUp?key=AIzaSyABImIzv4MA1BCbx1QzJ9IiOiODi9HWPs0');

    //this transforms the form into json format so it can be posted into db
    var response = await http.post(url, body: jsonEncode(formData));
    if (response.statusCode == 200) {
      //200 means it worked, saved to db
      //var user will hold the dict/map of json file
      var user = User.fromJson(jsonDecode(response.body));

      var urlDb = Uri.parse(
          'https://fir-exercise-7ca92-default-rtdb.firebaseio.com/users/12345.json' +
              user.localId! +
              '.json');

      var responseDB = await http.put(urlDb,
          body: jsonEncode(
              {'name': formData['name'], 'lastname': formData['lastname']}));
      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    }
    return false;
  }
}

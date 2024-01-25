import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:yellow_pages/models/user.dart';

class LoginProvider extends ChangeNotifier {
  String endpoint = 'https://identitytoolkit.googleapis.com/v1';
  LoginProvider() {
    print('initializing login_provider...');
  }

  Future<User?> loginUser(Map<String, String> formData) async {
    var url = Uri.parse(endpoint +
        '/accounts:signInWithPassword?key=AIzaSyABImIzv4MA1BCbx1QzJ9IiOiODi9HWPs0');

    //this transforms the form into json format so it can be posted into db
    var response = await http.post(url, body: jsonEncode(formData));
    if (response.statusCode == 200) {
      //200 means it worked, saved to db
      var user = User.fromJson(jsonDecode(response.body));
      var urlDb = Uri.parse(
          'https://fir-exercise-7ca92-default-rtdb.firebaseio.com/users/12345.json' +
              user.localId! +
              '.json');

      var responseDb = await http.get(urlDb);
      if (responseDb.statusCode == 200) {
        user.setUserDate(jsonDecode(responseDb.body));
        print(user.name);
        print(user.lastname);
        return user;
      }
    }
    return null;
  }
}

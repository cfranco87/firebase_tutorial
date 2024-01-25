import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yellow_pages/providers/login_provider.dart';
import 'package:yellow_pages/providers/providers.dart';
import 'package:yellow_pages/widgets/widgets.dart';

class LoginScreen extends StatefulWidget {
  // ignore: use_super_parameters
  const LoginScreen({Key? key}) : super(key: key);
  //creating screen/page file for registering
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var formKey = GlobalKey<FormState>();
  Map<String, String> formData = {
    //dict/map in which we save list in var formData
    'email': '', 'password': ''
  };
  LoginProvider loginProvider = LoginProvider();
  UserProvider userProvider = UserProvider();

  @override
  Widget build(BuildContext context) {
    loginProvider = Provider.of<LoginProvider>(context);
    userProvider = Provider.of<UserProvider>(context);

    return Scaffold(
        body: Container(
      width: double.infinity,
      color: Colors.yellow,
      child: Column(
        children: [
          const SizedBox(height: 35),
          const Icon(
            Icons.supervised_user_circle,
            size: 200,
            color: Colors.white,
          ),
          Expanded(
            child: Container(),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              child: Container(
                padding: const EdgeInsets.all(20),
                width: double.infinity,
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      const AppTitle('Initialize Session'),
                      const SizedBox(height: 25),
                      AppFormField(
                        'email',
                        'email',
                        formData: formData,
                        validator: (value) {
                          if (value!.length < 6) {
                            return "email Invalid";
                          }
                          return null;
                        },
                      ),
                      AppFormField(
                        'password',
                        'password',
                        obscureText: true,
                        formData: formData,
                        validator: (value) {
                          if (value!.length < 6) {
                            return "password Invalid";
                          }
                          return null;
                        },
                      ),
                      ElevatedButton(
                          onPressed: formLogin, child: const Text('Enter'))
                    ],
                  ),
                ),
              ),
            ),
          ),
          TextButton(
              onPressed: () {
                //Navigator takes us to page/route we want
                Navigator.pushNamed(context, 'register'); //example 'register'
              },
              child: const Text(
                'Register New Account',
                style: TextStyle(color: Colors.black),
              )),
          const SizedBox(height: 35),
        ],
      ),
    ));
  }

  formLogin() async {
    if (formKey.currentState!.validate()) {
      var user = await loginProvider.loginUser(formData);
      if (user != null) {
        userProvider.setUser(user);
        AppDialogs.showDialog2(context, 'Authenticated User', [
          TextButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.pushReplacementNamed(context, 'home');
              },
              child: const Text('OK'))
        ]);
      } else {
        AppDialogs.showDialogs1(context, 'Unable to initialize session');
      }
    } else {
      AppDialogs.showDialogs1(context, 'Unable to Authenticate');
    }
  }
}

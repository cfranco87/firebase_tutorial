import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yellow_pages/providers/register_provider.dart';
import 'package:yellow_pages/widgets/widgets.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});
  //creating screen/page file for registering

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  var formKey = GlobalKey<FormState>();
  Map<String, String> formData = {
    //our form on app
    'email': '',
    'password': '',
    'name': '',
    'lastname': ''
  };
  //dict/map in which we save list in var formData
  RegisterProvider registerProvider = RegisterProvider();

  @override
  Widget build(BuildContext context) {
    registerProvider = Provider.of<RegisterProvider>(context);

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
                  key: formKey, //formkey defined above
                  child: Column(
                    children: [
                      const AppTitle('Register User'),
                      const SizedBox(height: 25),
                      AppFormField(
                        'name',
                        'Name',
                        formData: formData,
                        validator: (value) {
                          if (value!.length < 4) {
                            return "Name Invalid";
                          }
                          return null;
                        },
                      ),
                      AppFormField(
                        'lastname',
                        'Last name',
                        obscureText: true,
                        formData: formData,
                        validator: (value) {
                          if (value!.length < 2) {
                            return "Last Name Invalid";
                          }
                          return null;
                        },
                      ),
                      ElevatedButton(
                          onPressed: formRegister,
                          child: const Text('Register'))
                    ],
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 35),
        ],
      ),
    ));
  }

  formRegister() async {
    //async at start of function
    //validate if form is filled
    if (formKey.currentState!.validate()) {
      bool response = await registerProvider.registerUser(formData);
      if (response) {
        AppDialogs.showDialogs1(context, 'Successful registration');
      } else {
        AppDialogs.showDialogs1(context, 'Unsuccessful registration');
      }
    } else {
      AppDialogs.showDialogs1(context, 'Unable to Validate');
      print("");
    }
  }
}

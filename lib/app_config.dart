import 'package:yellow_pages/screens/screens.dart';

class AppConfig {
  static String initialRoute = 'login'; //initial route to start

  //we create config folder because we can have up to 20-30 routes
  //in the future, need to always optimize the code
  static route() {
    return {
      //this is the routes for all the pages
      'login': ((context) => const LoginScreen()),
      'register': ((context) => const RegisterScreen()),
      'home': ((context) => const HomeScreen())
    };
  }
}

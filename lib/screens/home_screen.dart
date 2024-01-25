import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yellow_pages/providers/providers.dart';

class HomeScreen extends StatefulWidget {
  // ignore: use_super_parameters
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  UserProvider userProvider = UserProvider();
  @override
  Widget build(BuildContext context) {
    userProvider = Provider.of<UserProvider>(context);
    String name = userProvider.user.name!;
    return Scaffold(
        appBar: AppBar(
          title: const Text('Launch Yellow Pages'),
        ),
        body: Center(
          child: Text('Welcome' + name + 'to the Yellow Pages'),
        ));
  }
}

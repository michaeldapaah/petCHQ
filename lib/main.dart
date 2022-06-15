import 'package:flutter/material.dart';
import 'package:petchqapp/constants.dart';
import 'package:petchqapp/screens/home/home_screen.dart';

import 'screens/home/signin_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'PetschqApp',
      // initialRoute: '/',
      // routes: {
      //   // When navigating to the "/" route, build the FirstScreen widget.
      //   '/': (context) => const SignInScreen(),
      //   // When navigating to the "/second" route, build the SecondScreen widget.
      //   '/second': (context) => HomeScreen(),
      // },
      theme: ThemeData(
        scaffoldBackgroundColor: kBackgroundColor,
        primaryColor: kPrimaryColor,
        textTheme: Theme.of(context).textTheme.apply(bodyColor: kTextColor),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: SignInScreen(),
    );
  }
}

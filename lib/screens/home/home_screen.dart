import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:petchqapp/components/my_bottom_nav_bar.dart';
import 'package:petchqapp/screens/home/components/body.dart';
import 'package:petchqapp/screens/home/signin_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: Body(),
      bottomNavigationBar: MyBottomNavBar(),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        actions: [
          icobutton(),
        ],
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: <Color>[
                  Color.fromARGB(255, 179, 52, 94),
                  Colors.purple
                ]),
          ),
        ));
  }
}

class icobutton extends StatelessWidget {
  const icobutton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: SvgPicture.asset("assets/icons/power.svg", color: Colors.white),
      onPressed: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => SignInScreen(),
            ));
      },
    );
  }
}

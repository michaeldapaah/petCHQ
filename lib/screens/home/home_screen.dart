import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:petchqapp/components/my_bottom_nav_bar.dart';
import 'package:petchqapp/screens/home/components/body.dart';

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
        elevation: 0,
        leading: IconButton(
          icon: SvgPicture.asset("assets/icons/menu.svg"),
          color: Colors.white,
          onPressed: () {
            
          },
        ),
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

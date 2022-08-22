
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:plant_app/constants.dart';
import 'package:plant_app/profile.dart';
import 'package:plant_app/screens/fav.dart';
import 'package:plant_app/screens/home/home_screen.dart';


class MainScreen extends StatefulWidget {
  static const String id = 'main-Screen';

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  Widget currentScreen = HomeScreen();

  int index = 0;

  final PageStorageBucket _bucket = PageStorageBucket();


  @override
  Widget build(BuildContext context) {

    Color color = Theme.of(context).splashColor;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: WillPopScope(
        onWillPop: (){
          return Future.value(false);
        },
        child: ScrollConfiguration(
          behavior: ScrollBehavior(),
          child: GlowingOverscrollIndicator(
            axisDirection: AxisDirection.down,
            color: Color(0xff675492),
            child: PageStorage(
              child: currentScreen,
              bucket: _bucket,
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Theme.of(context).canvasColor,
        shape: CircularNotchedRectangle(),
        notchMargin: 8,
        child: SizedBox(
          height: 70,
          width: 100,
          child: Padding(
            padding: const EdgeInsets.only(left: 8.0,right: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                MaterialButton(
                  minWidth: 35,
                  onPressed: () {
                    setState(() {
                      index = 0;
                      currentScreen =  HomeScreen();
                    });
                  },
                  child: SvgPicture.asset("assets/icons/flower.svg", color: index == 0 ? kPrimaryColor : Colors.grey,),
                ),
                MaterialButton(
                  minWidth: 35,
                  onPressed: () {
                    setState(() {
                      index = 1;
                      currentScreen = const FaviourateScreen();
                    });
                  },
                  child: SvgPicture.asset("assets/icons/heart-icon.svg",color: index == 1 ? kPrimaryColor : Colors.grey,),
                ),
                MaterialButton(
                  minWidth: 35,
                  onPressed: () {
                    setState(() {
                      index = 2;
                      currentScreen = const Profile();
                    });
                  },
                  child: SvgPicture.asset("assets/icons/user-icon.svg",color: index == 2 ? kPrimaryColor : Colors.grey,),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

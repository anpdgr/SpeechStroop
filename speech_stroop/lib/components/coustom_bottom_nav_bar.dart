import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:speech_stroop/constants.dart';
import 'package:speech_stroop/screens/history/history_screen.dart';
import 'package:speech_stroop/screens/home/home_screen.dart';
import 'package:speech_stroop/screens/profile/profile_screen.dart';

import '../enums.dart';

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({
    Key key,
    this.selectedMenu,
  }) : super(key: key);

  final MenuState selectedMenu;

  @override
  Widget build(BuildContext context) {
    final Color inActiveIconColor = Color(0xFFB6B6B6);
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, -15),
            blurRadius: 20,
            color: Color(0xFFDADADA).withOpacity(0.15),
          ),
        ],
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
      ),
      child: SafeArea(
          top: false,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.only(top: 5),
                height: 77,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      IconButton(
                        padding: EdgeInsets.all(0),
                        icon: Icon(
                          Icons.bar_chart_rounded,
                          size: 50.0,
                          color: MenuState.history == selectedMenu
                              ? primaryColor
                              : inActiveIconColor,
                        ),
                        onPressed: () => {
                          if (MenuState.history != selectedMenu)
                            {
                              Navigator.pushNamed(
                                  context, HistoryScreen.routeName),
                            }
                        },
                      ),
                      const SizedBox(height: 1),
                      Text("ประวัติการทดสอบ",
                          style: Theme.of(context).textTheme.labelSmall.apply(
                                color: MenuState.history == selectedMenu
                                    ? primaryColor
                                    : inActiveIconColor,
                              ))
                    ]),
              ),
              Container(
                padding: EdgeInsets.only(top: 5),
                height: 77,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      IconButton(
                        padding: EdgeInsets.all(0),
                        icon: Icon(
                          Icons.home,
                          size: 50.0,
                          color: MenuState.home == selectedMenu
                              ? primaryColor
                              : inActiveIconColor,
                        ),
                        onPressed: () => {
                          if (MenuState.home != selectedMenu)
                            {
                              Navigator.pushNamed(
                                  context, HomeScreen.routeName),
                            }
                        },
                      ),
                      const SizedBox(height: 1),
                      Text("หน้าหลัก",
                          style: Theme.of(context).textTheme.labelSmall.apply(
                                color: MenuState.home == selectedMenu
                                    ? primaryColor
                                    : inActiveIconColor,
                              ))
                    ]),
              ),
              Container(
                padding: EdgeInsets.only(top: 5),
                height: 77,
                child: Column(children: [
                  IconButton(
                    padding: EdgeInsets.all(0),
                    icon: Icon(
                      Icons.person,
                      size: 50.0,
                      color: MenuState.profile == selectedMenu
                          ? primaryColor
                          : inActiveIconColor,
                    ),
                    onPressed: () => {
                      if (MenuState.profile != selectedMenu)
                        {
                          getUserProfile(),
                          Navigator.pushNamed(context, ProfileScreen.routeName),
                        },
                    },
                  ),
                  const SizedBox(height: 1),
                  Text("ข้อมูลส่วนตัว",
                      style: Theme.of(context).textTheme.labelSmall.apply(
                            color: MenuState.profile == selectedMenu
                                ? primaryColor
                                : inActiveIconColor,
                          ))
                ]),
              )
            ],
          )),
    );
  }
}

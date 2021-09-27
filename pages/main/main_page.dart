import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hack_misis_site/pages/hacks_screen/hacks_cubit.dart';
import 'package:hack_misis_site/pages/hacks_screen/hacks_screen.dart';
import 'package:hack_misis_site/pages/profile_screen/profile_cubit.dart';
import 'package:hack_misis_site/pages/profile_screen/profile_screen.dart';
import 'package:hack_misis_site/shared/colors.dart';

class MainPage extends StatefulWidget {
  MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  String screen = "hacks";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      body: Column(
        children: [
          (() {
            switch (screen) {
              case "hacks":
                return BlocProvider(
                  create: (c) => HacksCubit(),
                  child: HacksScreen(),
                );
              case "profile":
                return BlocProvider(
                  create: (c) => ProfileCubit(),
                  child: ProfileScreen(),
                );

              default:
                return Container();
            }
          }()),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        color: background,
        child: Row(
          children: [
            IconButton(
              iconSize: 35,
              icon: Icon(Icons.event),
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              color: (() {
                if (screen == "hacks") {
                  return text;
                }
                return textAccent;
              }()),
              onPressed: () {
                setState(() {
                  screen = "hacks";
                });
              },
            ),
            IconButton(
              iconSize: 35,
              icon: Icon(Icons.person),
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              color: (() {
                if (screen == "profile") {
                  return text;
                }
                return textAccent;
              }()),
              onPressed: () {
                setState(() {
                  screen = "profile";
                });
              },
            ),
          ],
          mainAxisAlignment: MainAxisAlignment.spaceAround,
        ),
      ),
    );
  }
}

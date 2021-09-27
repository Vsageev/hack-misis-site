import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hack_misis_site/pages/app_load/app_load_page.dart';
import 'package:hack_misis_site/pages/log_in/log_in_cubit.dart';
import 'package:hack_misis_site/pages/log_in/log_in_page.dart';
import 'package:hack_misis_site/pages/main/main_page.dart';
import 'package:hack_misis_site/pages/profile_screen/profile_cubit.dart';
import 'package:hack_misis_site/pages/profile_screen/states/profile_loaded.dart';
import 'package:hack_misis_site/pages/profile_screen/states/profile_state.dart';
import 'package:hack_misis_site/shared/button.dart';
import 'package:hack_misis_site/shared/open_link.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({Key? key}) : super(key: key);

  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocBuilder<ProfileCubit, ProfileState>(
        builder: (context, state) {
          if (auth.currentUser != null) {
            if (state is ProfileLoaded) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "telegram: ",
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      Text(
                        state.userModel.tgLink,
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.blue,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    height: 30,
                  ),
                  Button(
                    width: 400,
                    text: "заполнить фому",
                    onTap: () {
                      openLink(
                        context,
                        "https://docs.google.com/forms/d/e/1FAIpQLSdSNGQCGLsENB8AOrCCEfnCC24Q1MMRJwD8ewEliL3EtvGdEA/viewform",
                      );
                    },
                  ),
                  Container(
                    height: 30,
                  ),
                  Button(
                    width: 400,
                    color: Colors.red,
                    text: "Выйти",
                    onTap: () {
                      auth.signOut().then(
                            (value) => Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => MainPage(),
                                ),
                                (route) => false),
                          );
                    },
                  ),
                ],
              );
            }
          } else {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Button(
                  width: 400,
                  text: "Войти",
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => BlocProvider(
                          create: (c) => LogInCubit(),
                          child: LogInPage(),
                        ),
                      ),
                    );
                  },
                ),
                Container(
                  height: 30,
                ),
              ],
            );
          }

          return Container();
        },
      ),
    );
  }
}

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hack_misis_site/pages/add_hack/add_hack_page.dart';
import 'package:hack_misis_site/pages/hacks_screen/hacks_cubit.dart';
import 'package:hack_misis_site/pages/hacks_screen/hacks_list/hack_list_widget.dart';
import 'package:hack_misis_site/pages/hacks_screen/states/hacks_loaded.dart';
import 'package:hack_misis_site/pages/hacks_screen/states/hacks_state.dart';
import 'package:hack_misis_site/pages/teams/teams_cubit.dart';
import 'package:hack_misis_site/pages/teams/teams_page.dart';
import 'package:hack_misis_site/shared/button.dart';
import 'package:hack_misis_site/shared/colors.dart';
import 'package:hack_misis_site/shared/no_blink_inkwell.dart';
import 'package:hack_misis_site/shared/open_link.dart';
import 'package:hack_misis_site/shared/showPopup.dart';
import 'package:url_launcher/url_launcher.dart';

class HacksScreen extends StatelessWidget {
  HacksScreen({Key? key}) : super(key: key);

  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocBuilder<HacksCubit, HacksState>(builder: (context, state) {
        if (state is HacksLoaded) {
          return Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: (() {
                  if (auth.currentUser != null) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Button(
                          text: "сортировать по: " +
                              (() {
                                if (state.sortType == "registrationEnd") {
                                  return "конец регистрации";
                                }
                                return "начало";
                              }()),
                          onTap: () {
                            BlocProvider.of<HacksCubit>(context)
                                .changeSortType();
                          },
                        ),
                        Button(
                          text: "+добавить",
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return AddHackPage();
                                },
                              ),
                            );
                          },
                        )
                      ],
                    );
                  }
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Button(
                        text: "сортировать по: " +
                            (() {
                              if (state.sortType == "registrationEnd") {
                                return "конец регистрации";
                              }
                              return "начало";
                            }()),
                        onTap: () {
                          BlocProvider.of<HacksCubit>(context).changeSortType();
                        },
                      )
                    ],
                  );
                }()),
              ),
              HacksListWidget(hacksStream: state.hacksSnapshotsStream),
            ],
          );
        }
        return Container();
      }),
    );
  }
}

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hack_misis_site/pages/add_team/add_team_page.dart';
import 'package:hack_misis_site/pages/team/team_page.dart';
import 'package:hack_misis_site/pages/teams/states/teams_loaded.dart';
import 'package:hack_misis_site/pages/teams/states/teams_state.dart';
import 'package:hack_misis_site/pages/teams/teams_cubit.dart';
import 'package:hack_misis_site/pages/teams/teams_list/teams_list_widget.dart';
import 'package:hack_misis_site/shared/button.dart';
import 'package:hack_misis_site/shared/colors.dart';
import 'package:hack_misis_site/shared/no_blink_inkwell.dart';
import 'package:hack_misis_site/shared/top_back_widget.dart';

class TeamsPage extends StatelessWidget {
  TeamsPage({Key? key}) : super(key: key);

  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      body: BlocBuilder<TeamsCubit, TeamsState>(
        builder: (context, state) {
          return Column(
            children: [
              TopBackWidget(
                context,
                text: "Команды " + state.hack.name,
              ),
              Container(height: 20),
              (() {
                if (auth.currentUser != null) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Button(
                        text: "+добавить",
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return AddTeamPage(hackId: state.hack.id);
                              },
                            ),
                          );
                        },
                      )
                    ],
                  );
                }
                return Container();
              }()),
              (() {
                if (state is TeamsLoaded) {
                  return TeamsListWidget(
                      teamsStream: state.teamsSnapshotsStream);
                }
                return Container();
              }())
            ],
          );
        },
      ),
    );
  }
}

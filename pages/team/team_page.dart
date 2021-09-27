import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hack_misis_site/pages/redact_team/redact_team_page.dart';
import 'package:hack_misis_site/shared/button.dart';
import 'package:hack_misis_site/shared/colors.dart';
import 'package:hack_misis_site/shared/models/team_model.dart';
import 'package:hack_misis_site/shared/no_blink_inkwell.dart';
import 'package:hack_misis_site/shared/showPopup.dart';
import 'package:hack_misis_site/shared/top_back_widget.dart';
import 'package:url_launcher/url_launcher.dart';

class TeamPage extends StatelessWidget {
  TeamPage({Key? key, required this.team}) : super(key: key);

  final TeamModel team;

  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      body: Stack(
        children: [
          Column(
            children: [
              TopBackWidget(context, text: "О команде"),
              Expanded(
                child: SingleChildScrollView(
                  child: Container(
                    padding: EdgeInsets.only(
                        top: 20, left: 80, right: 80, bottom: 100),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Название:",
                          style: TextStyle(fontSize: 30),
                        ),
                        Text(
                          team.name,
                          style: TextStyle(fontSize: 30),
                        ),
                        Container(height: 20),
                        Text(
                          "Ссылка:",
                          style: TextStyle(fontSize: 30),
                        ),
                        Row(
                          children: [
                            NoBlinkInkWell(
                              onTap: () async {
                                String url = team.link;
                                if (await canLaunch(url))
                                  await launch(url);
                                else
                                  showPopup(context, 'couldn\'t launch url');
                              },
                              child: Text(
                                team.link,
                                style: TextStyle(
                                  fontSize: 30,
                                  color: Colors.blue,
                                ),
                              ),
                            ),
                            IconButton(
                              iconSize: 35,
                              icon: Icon(Icons.copy),
                              splashColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              color: textAccent,
                              onPressed: () {
                                Clipboard.setData(
                                    new ClipboardData(text: team.link));
                                showPopup(context, "copied");
                              },
                            ),
                          ],
                        ),
                        Container(height: 20),
                        Text(
                          "Главное:",
                          style: TextStyle(fontSize: 30),
                        ),
                        Text(
                          team.mainInfo,
                          style: TextStyle(fontSize: 30),
                        ),
                        Container(height: 20),
                        Text(
                          "Общее:",
                          style: TextStyle(fontSize: 30),
                        ),
                        Text(
                          team.info,
                          style: TextStyle(fontSize: 30),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
          (() {
            if (auth.currentUser != null &&
                team.creatorId == auth.currentUser!.uid) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Expanded(child: Container()),
                  Row(
                    children: [
                      Expanded(
                        child: Button(
                          margin: EdgeInsets.all(15),
                          child: Center(
                            child: Text(
                              "Изменить",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                              ),
                            ),
                          ),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (cont) =>
                                    RedactTeamPage(teamModel: this.team),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              );
            }
            return Container();
          }()),
        ],
      ),
    );
  }
}

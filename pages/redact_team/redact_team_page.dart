import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hack_misis_site/shared/button.dart';
import 'package:hack_misis_site/shared/colors.dart';
import 'package:hack_misis_site/shared/models/team_model.dart';
import 'package:hack_misis_site/shared/showPopup.dart';
import 'package:hack_misis_site/shared/text_form.dart';
import 'package:hack_misis_site/shared/top_back_widget.dart';

class RedactTeamPage extends StatelessWidget {
  RedactTeamPage({Key? key, required this.teamModel}) : super(key: key);

  TeamModel teamModel;
  TextEditingController nameController = TextEditingController();
  TextEditingController linkController = TextEditingController();
  TextEditingController mainInfoController = TextEditingController();
  TextEditingController infoController = TextEditingController();
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  FirebaseAuth auth = FirebaseAuth.instance;

  _redactTeam(BuildContext ctx) {
    teamModel.ref.update(
      TeamModel.ModelMap(
        name: nameController.text == "" ? teamModel.name : nameController.text,
        mainInfo: mainInfoController.text == ""
            ? teamModel.mainInfo
            : mainInfoController.text,
        info: infoController.text == "" ? teamModel.info : infoController.text,
        link: linkController.text == "" ? teamModel.link : linkController.text,
        creatorId: teamModel.creatorId,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      body: Stack(
        children: [
          Column(
            children: [
              TopBackWidget(
                context,
                text: "Изменить команду",
              ),
              Expanded(
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Container(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Row(
                          children: [
                            Text(
                              "Название: ",
                              style: TextStyle(color: text, fontSize: 20),
                              textAlign: TextAlign.left,
                            ),
                            Expanded(
                              child: TextForm(
                                textController: nameController,
                                hintText: teamModel.name,
                              ),
                            ),
                          ],
                        ),
                        Container(height: 30),
                        Row(
                          children: [
                            Text(
                              "Ссылка: ",
                              style: TextStyle(color: text, fontSize: 20),
                              textAlign: TextAlign.left,
                            ),
                            Expanded(
                              child: TextForm(
                                textController: linkController,
                                hintText: teamModel.link,
                              ),
                            ),
                          ],
                        ),
                        Container(height: 30),
                        Row(
                          children: [
                            Text(
                              "Главное о команде: ",
                              style: TextStyle(color: text, fontSize: 20),
                              textAlign: TextAlign.left,
                            ),
                            Expanded(
                              child: TextForm(
                                maxLength: 100,
                                textController: mainInfoController,
                                hintText: teamModel.mainInfo,
                              ),
                            ),
                          ],
                        ),
                        Container(height: 30),
                        Row(
                          children: [
                            Text(
                              "О команде: ",
                              style: TextStyle(color: text, fontSize: 20),
                              textAlign: TextAlign.left,
                            ),
                            Expanded(
                              child: TextForm(
                                textController: infoController,
                                hintText: teamModel.link,
                              ),
                            ),
                          ],
                        ),
                        Container(height: 100),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          Column(
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
                          "Сохранить",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                      ),
                      onTap: () {
                        _redactTeam(context);
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}

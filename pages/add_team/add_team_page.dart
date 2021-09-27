import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hack_misis_site/shared/button.dart';
import 'package:hack_misis_site/shared/colors.dart';
import 'package:hack_misis_site/shared/models/team_model.dart';
import 'package:hack_misis_site/shared/text_form.dart';
import 'package:hack_misis_site/shared/top_back_widget.dart';

class AddTeamPage extends StatelessWidget {
  AddTeamPage({Key? key, required this.hackId}) : super(key: key);

  String hackId;
  TextEditingController nameController = TextEditingController();
  TextEditingController linkController = TextEditingController();
  TextEditingController mainInfoController = TextEditingController();
  TextEditingController infoController = TextEditingController();
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  FirebaseAuth auth = FirebaseAuth.instance;

  _addTeam() {
    if (auth.currentUser != null) {
      firestore.collection('hacks').doc(hackId).collection('teams').doc().set(
            TeamModel.ModelMap(
              name: nameController.text,
              mainInfo: mainInfoController.text,
              info: infoController.text,
              link: linkController.text,
              creatorId: auth.currentUser!.uid,
            ),
          );
    }
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
                text: "Добавить команду",
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
                          "Создать",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                      ),
                      onTap: () {
                        _addTeam();
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

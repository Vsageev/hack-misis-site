import 'package:flutter/material.dart';
import 'package:hack_misis_site/pages/team/team_page.dart';
import 'package:hack_misis_site/shared/colors.dart';
import 'package:hack_misis_site/shared/models/team_model.dart';
import 'package:hack_misis_site/shared/no_blink_inkwell.dart';

class TeamsItemWidget extends StatelessWidget {
  const TeamsItemWidget({Key? key, required this.teamModel}) : super(key: key);

  final TeamModel teamModel;

  @override
  Widget build(BuildContext context) {
    return NoBlinkInkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (c) => TeamPage(
              team: teamModel,
            ),
          ),
        );
      },
      child: Container(
        padding: EdgeInsets.all(20),
        margin: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: bright,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            Text(
              teamModel.name,
              style: TextStyle(color: textReverse, fontSize: 30),
            ),
            Container(
              decoration: BoxDecoration(
                color: textReverse,
                borderRadius: BorderRadius.circular(10),
              ),
              padding: EdgeInsets.all(7),
              child: Text(
                teamModel.mainInfo,
                style: TextStyle(color: text, fontSize: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

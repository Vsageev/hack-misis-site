import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hack_misis_site/pages/hacks_screen/hacks_list/hacks_item_widget.dart';
import 'package:hack_misis_site/pages/teams/teams_list/teams_item_widget.dart';
import 'package:hack_misis_site/shared/models/hack_model.dart';
import 'package:hack_misis_site/shared/models/team_model.dart';

class TeamsListWidget extends StatelessWidget {
  const TeamsListWidget({Key? key, required this.teamsStream})
      : super(key: key);

  final Stream<QuerySnapshot<Map<String, dynamic>>> teamsStream;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
        stream: teamsStream,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              padding: EdgeInsets.all(0),
              physics: BouncingScrollPhysics(),
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (BuildContext context, int index) {
                return TeamsItemWidget(
                    teamModel: TeamModel.fromMap(
                        snapshot.data!.docs[index].data(),
                        snapshot.data!.docs[index].id,
                        snapshot.data!.docs[index].reference));
              },
            );
          }
          return Container();
        },
      ),
    );
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:hack_misis_site/pages/teams/states/teams_state.dart';
import 'package:hack_misis_site/shared/models/hack_model.dart';
import 'package:hack_misis_site/shared/models/team_model.dart';

class TeamsLoaded extends TeamsState {
  Stream<QuerySnapshot<Map<String, dynamic>>> teamsSnapshotsStream;
  TeamsLoaded({
    required this.teamsSnapshotsStream,
    required HackModel hack,
  }) : super(hack: hack);
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hack_misis_site/pages/teams/states/teams_loaded.dart';
import 'package:hack_misis_site/pages/teams/states/teams_loading.dart';
import 'package:hack_misis_site/pages/teams/states/teams_state.dart';
import 'package:hack_misis_site/shared/models/hack_model.dart';
import 'package:hack_misis_site/shared/models/team_model.dart';

class TeamsCubit extends Cubit<TeamsState> {
  TeamsCubit(this.hack) : super(TeamsLoading(hack)) {
    getAll();
  }

  HackModel hack;

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  void getAll() async {
    var teamsSnapshotsStream = firestore
        .collection('hacks')
        .doc(hack.id)
        .collection('teams')
        .snapshots();

    emit(TeamsLoaded(teamsSnapshotsStream: teamsSnapshotsStream, hack: hack));
  }
}

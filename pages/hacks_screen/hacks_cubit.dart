import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hack_misis_site/pages/hacks_screen/states/hacks_loading.dart';
import 'package:hack_misis_site/pages/hacks_screen/states/hacks_loaded.dart';
import 'package:hack_misis_site/pages/hacks_screen/states/hacks_state.dart';
import 'package:hack_misis_site/shared/models/hack_model.dart';

class HacksCubit extends Cubit<HacksState> {
  HacksCubit() : super(HacksLoading()) {
    getAll();
  }

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  changeSortType() async {
    var stateT = state;
    if (stateT is HacksLoaded) {
      if (stateT.sortType == "startDate") {
        var hacksSnapshotsStream = firestore
            .collection('hacks')
            .orderBy('registrationEnd')
            .snapshots();

        emit(HacksLoaded(
            hacksSnapshotsStream: hacksSnapshotsStream,
            sortType: "registrationEnd"));
      } else {
        var hacksSnapshotsStream =
            firestore.collection('hacks').orderBy('startDate').snapshots();

        emit(HacksLoaded(
            hacksSnapshotsStream: hacksSnapshotsStream, sortType: "startDate"));
      }
    }
  }

  void getAll() async {
    var hacksSnapshotsStream =
        firestore.collection('hacks').orderBy('startDate').snapshots();

    emit(HacksLoaded(
        hacksSnapshotsStream: hacksSnapshotsStream, sortType: "startDate"));
  }
}

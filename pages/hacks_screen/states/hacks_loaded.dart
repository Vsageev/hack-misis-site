import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:hack_misis_site/pages/hacks_screen/states/hacks_state.dart';

class HacksLoaded extends HacksState {
  Stream<QuerySnapshot<Map<String, dynamic>>> hacksSnapshotsStream;
  String sortType;
  HacksLoaded({
    required this.hacksSnapshotsStream,
    required this.sortType,
  });
}

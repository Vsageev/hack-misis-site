import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hack_misis_site/pages/profile_screen/states/profile_loaded.dart';
import 'package:hack_misis_site/pages/profile_screen/states/profile_loaging.dart';
import 'package:hack_misis_site/pages/profile_screen/states/profile_state.dart';
import 'package:hack_misis_site/shared/loged_in_redirect.dart';
import 'package:hack_misis_site/shared/models/user_model.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileLoading()) {
    getProfile();
  }

  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  getProfile() async {
    if (auth.currentUser != null) {
      UserModel userModel = await firestore
          .collection('users')
          .doc(auth.currentUser!.uid)
          .get()
          .then((value) => UserModel.fromMap(value.data()!));
      emit(ProfileLoaded(userModel: userModel));
    }
  }
}

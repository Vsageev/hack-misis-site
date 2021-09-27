import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hack_misis_site/pages/registration/states/registration_state.dart';
import 'package:hack_misis_site/shared/loged_in_redirect.dart';

class RegistrationCubit extends Cubit<RegistrationState> {
  RegistrationCubit() : super(RegistrationState()) {}

  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<String> register(String email, String password, String tgLink) async {
    try {
      await auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) => firestore
              .collection('users')
              .doc(value.user!.uid)
              .set({'tgLink': tgLink.trim()}));

      return "OK";
    } on FirebaseAuthException catch (e) {
      return e.message!;
    }
  }

  Future signOut() async {
    await auth.signOut();
  }
}

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hack_misis_site/pages/main/main_page.dart';


FirebaseFirestore firestore = FirebaseFirestore.instance;

/// makes user fill necessary fields if they have registrated but haven't filled them yet, othervise redirects to the main page
logedInRedirect(BuildContext context) async {
  Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) => MainPage(),
      ),
      (route) => false);
}

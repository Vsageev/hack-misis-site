import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hack_misis_site/pages/log_in/log_in_cubit.dart';
import 'package:hack_misis_site/pages/log_in/log_in_page.dart';
import 'package:hack_misis_site/shared/loged_in_redirect.dart';
import 'package:hack_misis_site/shared/showPopup.dart';

class AppLoadPage extends StatelessWidget {
  AppLoadPage({Key? key}) : super(key: key);

  FirebaseAuth auth = FirebaseAuth.instance;

  _load(BuildContext context) async {
    auth.authStateChanges().listen((user) {
      if (user != null) {
        logedInRedirect(context);
      }
    });
    if (auth.currentUser != null) {
      logedInRedirect(context);
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => LogInCubit(),
            child: LogInPage(),
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance!.addPostFrameCallback((_) => _load(context));
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(),
    );
  }
}

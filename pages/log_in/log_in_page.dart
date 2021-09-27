import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hack_misis_site/pages/log_in/log_in_cubit.dart';
import 'package:hack_misis_site/pages/registration/register_cubit.dart';
import 'package:hack_misis_site/pages/registration/registration_page.dart';
import 'package:hack_misis_site/shared/button.dart';
import 'package:hack_misis_site/shared/loged_in_redirect.dart';
import 'package:hack_misis_site/shared/showPopup.dart';
import 'package:hack_misis_site/shared/top_back_widget.dart';

class LogInPage extends StatelessWidget {
  LogInPage({Key? key}) : super(key: key);

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  FirebaseAuth auth = FirebaseAuth.instance;

  _logIn(BuildContext context) async {
    String rez = await BlocProvider.of<LogInCubit>(context)
        .logIn(emailController.text, passwordController.text);

    if (rez == "OK") {
      logedInRedirect(context);
    } else {
      showPopup(context, rez);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Column(
            children: [
              TopBackWidget(context, text: "Войти в аккаунт"),
              Expanded(child: Container()),
              Button(
                width: 250,
                padding: EdgeInsets.all(15),
                color: Colors.blue,
                child: Center(
                  child: Text(
                    "Зарегестрироваться",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BlocProvider(
                        create: (context) => RegistrationCubit(),
                        child: RegistrationPage(),
                      ),
                    ),
                  );
                },
              ),
              Container(height: 40),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(),
              Text(
                'Электронная почта',
                // style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              Container(
                width: 250,
                padding: EdgeInsets.all(3),
                margin: EdgeInsets.all(5),
                child: TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                    hintStyle: TextStyle(
                      color: Colors.grey,
                    ),
                    // border: InputBorder.none,
                  ),
                ),
                // decoration: BoxDecoration(
                //   color: Colors.white,
                //   borderRadius: BorderRadius.circular(20),
                // ),
              ),
              Text(' '),
              Text(
                'Пароль',
                // style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              Container(
                width: 250,
                padding: EdgeInsets.all(3),
                margin: EdgeInsets.all(5),
                child: TextField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    hintStyle: TextStyle(
                      color: Colors.grey,
                    ),
                    // border: InputBorder.none,
                  ),
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              Text(' '),
              Button(
                width: 250,
                padding: EdgeInsets.all(15),
                child: Center(
                  child: Text(
                    "Войти",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ),
                onTap: () {
                  _logIn(context);
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}

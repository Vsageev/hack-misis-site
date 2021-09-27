import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hack_misis_site/pages/registration/register_cubit.dart';
import 'package:hack_misis_site/shared/button.dart';
import 'package:hack_misis_site/shared/colors.dart';
import 'package:hack_misis_site/shared/loged_in_redirect.dart';
import 'package:hack_misis_site/shared/showPopup.dart';
import 'package:hack_misis_site/shared/text_form.dart';
import 'package:hack_misis_site/shared/top_back_widget.dart';

class RegistrationPage extends StatelessWidget {
  RegistrationPage({Key? key}) : super(key: key);

  final tgLinkController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController1 = TextEditingController();
  final passwordController2 = TextEditingController();

  _register(BuildContext context) async {
    if (passwordController1.text == passwordController2.text) {
      String res = await BlocProvider.of<RegistrationCubit>(context).register(
          emailController.text,
          passwordController1.text,
          tgLinkController.text);

      if (res == "OK") {
        logedInRedirect(context);
      } else {
        showPopup(context, res);
      }
    } else {
      showPopup(context, "passwords do not match");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      body: Stack(
        children: [
          Column(
            children: [
              TopBackWidget(
                context,
                text: "Регистрация",
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(),
              Text(
                'Электронная почта',
              ),
              Container(
                width: 250,
                padding: EdgeInsets.all(3),
                margin: EdgeInsets.all(5),
                child: TextField(
                  controller: emailController,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              Container(
                height: 40,
              ),
              Text(
                'Пароль',
              ),
              Container(
                width: 250,
                padding: EdgeInsets.all(3),
                margin: EdgeInsets.all(5),
                child: TextField(
                  controller: passwordController1,
                  obscureText: true,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              Container(
                width: 250,
                padding: EdgeInsets.all(3),
                margin: EdgeInsets.all(5),
                child: TextField(
                  obscureText: true,
                  controller: passwordController2,
                  decoration: InputDecoration(
                    hintText: "Введите повторно",
                    hintStyle: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              Container(
                height: 40,
              ),
              Text(
                'Ссылка на телеграм',
              ),
              Container(
                width: 250,
                padding: EdgeInsets.all(3),
                margin: EdgeInsets.all(5),
                child: TextField(
                  controller: tgLinkController,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              Text(' '),
              Button(
                width: 250,
                text: "зарегистрироваться",
                onTap: () {
                  _register(context);
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}

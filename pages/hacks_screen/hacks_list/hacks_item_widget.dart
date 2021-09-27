import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hack_misis_site/pages/teams/teams_cubit.dart';
import 'package:hack_misis_site/pages/teams/teams_page.dart';
import 'package:hack_misis_site/shared/colors.dart';
import 'package:hack_misis_site/shared/models/hack_model.dart';
import 'package:hack_misis_site/shared/no_blink_inkwell.dart';
import 'package:hack_misis_site/shared/open_link.dart';
import 'package:http/http.dart' as http;

class HacksItemWidget extends StatelessWidget {
  const HacksItemWidget({Key? key, required this.hackModel}) : super(key: key);

  final HackModel hackModel;

  String trimYear(String date) {
    return date.split('.')[1] + '.' + date.split('.')[2];
  }

  @override
  Widget build(BuildContext context) {
    return NoBlinkInkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => BlocProvider(
              create: (context) => TeamsCubit(hackModel),
              child: TeamsPage(),
            ),
          ),
        );
      },
      child: Container(
        padding: EdgeInsets.all(20),
        margin: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: bright,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 30,
                  width: 30,
                  clipBehavior: Clip.hardEdge,
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                  ),
                  child: Image.network(
                    "https://www.google.com/s2/favicons?domain=" +
                        hackModel.link,
                    fit: BoxFit.fitHeight,
                  ),
                ),
                Container(width: 10),
                Text(
                  hackModel.name,
                  style: TextStyle(color: textReverse, fontSize: 30),
                ),
              ],
            ),
            Container(height: 5),
            Text(
              "Конец регистрации: " + trimYear(hackModel.registrationEnd),
              style: TextStyle(color: textReverse, fontSize: 17),
            ),
            Container(height: 5),
            Text(
              "Даты проведения: " +
                  trimYear(hackModel.startDate) +
                  " - " +
                  trimYear(hackModel.endDate),
              style: TextStyle(color: textReverse, fontSize: 17),
            ),
            Container(height: 5),
            NoBlinkInkWell(
              onTap: () {
                openLink(context, hackModel.link);
              },
              child: Container(
                decoration: BoxDecoration(
                  color: textReverse,
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: EdgeInsets.all(7),
                child: Text(
                  hackModel.link,
                  style: TextStyle(color: text, fontSize: 20),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

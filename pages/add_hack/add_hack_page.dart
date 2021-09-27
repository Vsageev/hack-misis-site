import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hack_misis_site/shared/button.dart';
import 'package:hack_misis_site/shared/colors.dart';
import 'package:hack_misis_site/shared/loged_in_redirect.dart';
import 'package:hack_misis_site/shared/models/hack_model.dart';
import 'package:hack_misis_site/shared/no_blink_inkwell.dart';
import 'package:hack_misis_site/shared/text_form.dart';
import 'package:hack_misis_site/shared/top_back_widget.dart';
import 'package:date_format/date_format.dart';

class AddHackPage extends StatelessWidget {
  AddHackPage({Key? key}) : super(key: key);

  TextEditingController nameController = TextEditingController();
  TextEditingController linkController = TextEditingController();
  TextEditingController startDateController = TextEditingController();
  TextEditingController endDateController = TextEditingController();
  TextEditingController registrationEndDateController = TextEditingController();
  TextEditingController registrationEndTimeController = TextEditingController();
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  _selectDate(BuildContext context, TextEditingController controller) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        initialDatePickerMode: DatePickerMode.day,
        firstDate: DateTime(2015),
        lastDate: DateTime(2101));

    if (picked != null) {
      controller.text = formatDate(picked, [yy, '.', mm, '.', dd]);
    } else {
      controller.text = "";
    }
  }

  _selectTime(BuildContext context, TextEditingController controller) async {
    final TimeOfDay? picked =
        await showTimePicker(context: context, initialTime: TimeOfDay.now());
    if (picked != null) {
      controller.text = picked.hour.toString().padLeft(2, '0') +
          ":" +
          picked.minute.toString().padLeft(2, '0');
    }
  }

  _addHack() {
    firestore.collection('hacks').doc().set(
          HackModel(
                  id: 'someId',
                  name: nameController.text,
                  link: linkController.text,
                  endDate: endDateController.text,
                  startDate: startDateController.text,
                  registrationEnd: registrationEndDateController.text +
                      " " +
                      registrationEndTimeController.text)
              .toMap(),
        );
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
                text: "Добавить событие",
              ),
              Expanded(
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Container(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Row(
                          children: [
                            Text(
                              "Название: ",
                              style: TextStyle(color: text, fontSize: 20),
                              textAlign: TextAlign.left,
                            ),
                            Expanded(
                              child: TextForm(
                                textController: nameController,
                              ),
                            ),
                          ],
                        ),
                        Container(height: 30),
                        Row(
                          children: [
                            Text(
                              "Ссылка: ",
                              style: TextStyle(color: text, fontSize: 20),
                              textAlign: TextAlign.left,
                            ),
                            Expanded(
                              child: TextForm(
                                textController: linkController,
                              ),
                            ),
                          ],
                        ),
                        Container(height: 30),
                        Row(
                          children: [
                            Text(
                              "Конец регистрации: ",
                              style: TextStyle(color: text, fontSize: 20),
                              textAlign: TextAlign.left,
                            ),
                            Expanded(
                              child: NoBlinkInkWell(
                                child: TextForm(
                                  textController: registrationEndDateController,
                                  hintText: "гг.мм.дд",
                                  enabled: false,
                                ),
                                onTap: () {
                                  _selectDate(
                                      context, registrationEndDateController);
                                },
                              ),
                            ),
                            Expanded(
                              child: NoBlinkInkWell(
                                child: TextForm(
                                  width: 80,
                                  textController: registrationEndTimeController,
                                  hintText: "чч.мм",
                                  enabled: false,
                                ),
                                onTap: () {
                                  _selectTime(
                                      context, registrationEndTimeController);
                                },
                              ),
                            ),
                          ],
                        ),
                        Container(height: 30),
                        Row(
                          children: [
                            Text(
                              "Начало: ",
                              style: TextStyle(color: text, fontSize: 20),
                              textAlign: TextAlign.left,
                            ),
                            Expanded(
                              child: NoBlinkInkWell(
                                child: TextForm(
                                  textController: startDateController,
                                  hintText: "гг.мм.дд",
                                  enabled: false,
                                ),
                                onTap: () {
                                  _selectDate(context, startDateController);
                                },
                              ),
                            )
                          ],
                        ),
                        Container(height: 30),
                        Row(
                          children: [
                            Text(
                              "Конец: ",
                              style: TextStyle(color: text, fontSize: 20),
                              textAlign: TextAlign.left,
                            ),
                            Expanded(
                              child: NoBlinkInkWell(
                                child: TextForm(
                                  textController: endDateController,
                                  hintText: "гг.мм.дд",
                                  enabled: false,
                                ),
                                onTap: () {
                                  _selectDate(context, endDateController);
                                },
                              ),
                            )
                          ],
                        ),
                        Container(height: 100),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Expanded(child: Container()),
              Row(
                children: [
                  Expanded(
                    child: Button(
                      margin: EdgeInsets.all(15),
                      child: Center(
                        child: Text(
                          "Создать",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                      ),
                      onTap: () {
                        _addHack();
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}

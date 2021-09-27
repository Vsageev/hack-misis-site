import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hack_misis_site/pages/hacks_screen/hacks_list/hacks_item_widget.dart';
import 'package:hack_misis_site/shared/models/hack_model.dart';

class HacksListWidget extends StatelessWidget {
  const HacksListWidget({Key? key, required this.hacksStream})
      : super(key: key);

  final Stream<QuerySnapshot<Map<String, dynamic>>> hacksStream;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
        stream: hacksStream,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              padding: EdgeInsets.all(0),
              physics: BouncingScrollPhysics(),
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (BuildContext context, int index) {
                return HacksItemWidget(
                    hackModel: HackModel.fromMap(
                  snapshot.data!.docs[index].data(),
                  snapshot.data!.docs[index].id,
                ));
              },
            );
          }
          return Container();
        },
      ),
    );
  }
}

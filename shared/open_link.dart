import 'package:flutter/cupertino.dart';
import 'package:hack_misis_site/shared/showPopup.dart';
import 'package:url_launcher/url_launcher.dart';

openLink(BuildContext context, String url) async {
  if (await canLaunch(url))
    await launch(url);
  else
    showPopup(context, 'couldn\'t launch url');
}

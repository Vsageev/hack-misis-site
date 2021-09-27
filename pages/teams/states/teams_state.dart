import 'package:hack_misis_site/shared/models/hack_model.dart';
import 'package:hack_misis_site/shared/models/team_model.dart';

abstract class TeamsState {
  HackModel hack;
  TeamsState({
    required this.hack,
  });
}

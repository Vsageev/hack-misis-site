import 'package:hack_misis_site/pages/profile_screen/states/profile_state.dart';
import 'package:hack_misis_site/shared/models/user_model.dart';

class ProfileLoaded extends ProfileState {
  UserModel userModel;
  ProfileLoaded({
    required this.userModel,
  });
}

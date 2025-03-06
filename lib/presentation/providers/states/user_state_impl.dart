import 'package:test_onr/domain/entities/user/user_entity.dart';
import 'package:test_onr/domain/states/user_state.dart';

class UserStateImpl extends UserState {
  UserEntity? _user;

  @override
  UserEntity? get user => _user;

  @override
  set user(UserEntity? user) {
    _user = user;
    notifyListeners();
  }
}

import 'package:test_onr/domain/entities/user/user_entity.dart';
import 'package:test_onr/domain/states/state_domain.dart';

abstract class UserState extends StateDomain {
  abstract UserEntity? user;
}

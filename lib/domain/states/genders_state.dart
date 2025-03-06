import 'package:test_rappi/domain/entities/genrer/genrer_entity.dart';
import 'package:test_rappi/domain/states/state_domain.dart';

abstract class GenrersState extends StateDomain {
  abstract List<GenrerEntity> genrers;
}

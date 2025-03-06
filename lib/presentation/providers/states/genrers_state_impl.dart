import 'package:test_rappi/domain/entities/genrer/genrer_entity.dart';
import 'package:test_rappi/domain/states/genders_state.dart';

class GenrersStateImpl extends GenrersState {
  List<GenrerEntity> _genrers = [];

  @override
  List<GenrerEntity> get genrers => _genrers;

  @override
  set genrers(List<GenrerEntity> value) {
    _genrers = value;
    notifyListeners();
  }
}

import 'package:test_rappi/domain/entities/genrer/genrer_entity.dart';
import 'package:test_rappi/domain/repositories/genrer_repository.dart';
import 'package:test_rappi/domain/states/genders_state.dart';

class GetAllGenrersUseCase {
  final GenrerRepository _genrerRepository;
  final GenrersState _genrersState;

  GetAllGenrersUseCase({
    required GenrerRepository genrerRepository,
    required GenrersState genrersState,
  })  : _genrerRepository = genrerRepository,
        _genrersState = genrersState;

  Future<List<GenrerEntity>> call(bool? firstCall) async {
    if (firstCall != true && _genrersState.genrers.isNotEmpty) {
      return _genrersState.genrers;
    }
    List<GenrerEntity> genrers = await _genrerRepository.getGenrers();
    _genrersState.genrers = genrers;
    _genrersState.notifyAll();
    return genrers;
  }
}

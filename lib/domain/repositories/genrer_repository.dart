import 'package:test_rappi/domain/entities/genrer/genrer_entity.dart';

abstract class GenrerRepository {
  Future<List<GenrerEntity>> getGenrers();
}

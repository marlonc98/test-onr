import 'package:either_dart/either.dart';
import 'package:test_onr/domain/entities/exception_entity.dart';
import 'package:test_onr/domain/entities/product/product_entity.dart';
import 'package:test_onr/domain/repositories/product_repository.dart';

class GetProductByIdUseCase {
  final ProductRepository productRepository;

  GetProductByIdUseCase({
    required this.productRepository,
  });

  Future<Either<ExceptionEntity, ProductEntity>> call(int id) async {
    return await productRepository.getById(id);
  }
}

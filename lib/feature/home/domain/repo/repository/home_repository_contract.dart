
import 'package:e_commerce/core/network/network.dart';
import 'package:e_commerce/feature/home/domain/entities/category_entity.dart';
import 'package:e_commerce/feature/home/domain/entities/product_entity.dart';

abstract class HomeRepositoryContract {
  Future<NetworkResult<List<CategoryEntity>>> getCategories();
    // Future<NetworkResult<List<ProductResponseDto>>> getProductsByCategory(int id);
    Future<NetworkResult<List<ProductEntity>>> getAllProducts();
}

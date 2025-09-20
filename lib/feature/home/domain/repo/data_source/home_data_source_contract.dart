import 'package:e_commerce/core/network/network.dart';

import 'package:e_commerce/feature/home/data/model/response/product_response_dto.dart';
import 'package:e_commerce/feature/home/domain/entities/category_entity.dart';
import 'package:e_commerce/feature/home/domain/entities/product_entity.dart';


abstract class HomeRemoteDataSourceContract {
  Future<NetworkResult<List<CategoryEntity>>> getCategories();
  //  Future<NetworkResult<List<ProductResponseDto>>>getProductsByCategory(int id);
   Future<NetworkResult<List<ProductEntity>>>getAllProducts();
}

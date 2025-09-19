import 'package:e_commerce/core/network/network.dart';
import 'package:e_commerce/feature/home/data/model/response/category_response_dto.dart';
import 'package:e_commerce/feature/home/data/model/response/product_response_dto.dart';


abstract class HomeRemoteDataSourceContract {
  Future<NetworkResult<List<CategoryResponseDto>>> getCategories();
  //  Future<NetworkResult<List<ProductResponseDto>>>getProductsByCategory(int id);
   Future<NetworkResult<List<ProductResponseDto>>>getAllProducts();
}

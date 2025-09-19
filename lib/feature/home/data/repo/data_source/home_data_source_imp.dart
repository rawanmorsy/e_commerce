import 'package:e_commerce/core/network/network.dart';
import 'package:e_commerce/feature/home/data/api/home_api.dart';
import 'package:e_commerce/feature/home/data/model/response/category_response_dto.dart';
import 'package:e_commerce/feature/home/data/model/response/product_response_dto.dart';
import 'package:e_commerce/feature/home/data/repo/data_source/home_data_source_contract.dart';

class HomeRemoteDataSourceImp implements HomeRemoteDataSourceContract {
  HomeRemoteDataSourceImp(this._homeApi);
 final HomeApi _homeApi;
  @override
  Future<NetworkResult<List<CategoryResponseDto>>> getCategories() =>
      _homeApi.getCategories();

  @override
  // Future<NetworkResult<List<ProductResponseDto>>> getProductsByCategory(int id) => _homeApi.getProductsByCategory(id);
  
  @override
  Future<NetworkResult<List<ProductResponseDto>>> getAllProducts() => _homeApi.getAllProducts();
}

HomeRemoteDataSourceContract homeDataSourceInjectable() => HomeRemoteDataSourceImp(HomeApi.instance);
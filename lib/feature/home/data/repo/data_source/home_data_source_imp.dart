import 'package:e_commerce/core/network/network.dart';
import 'package:e_commerce/feature/home/data/api/home_api.dart';
import 'package:e_commerce/feature/home/data/model/response/category_response_dto.dart';
import 'package:e_commerce/feature/home/data/model/response/product_response_dto.dart';
import 'package:e_commerce/feature/home/domain/entities/category_entity.dart';
import 'package:e_commerce/feature/home/domain/entities/product_entity.dart';
import 'package:e_commerce/feature/home/domain/repo/data_source/home_data_source_contract.dart';

class HomeRemoteDataSourceImp implements HomeRemoteDataSourceContract {
  HomeRemoteDataSourceImp(this._homeApi);
  final HomeApi _homeApi;

  @override
  Future<NetworkResult<List<ProductEntity>>> getAllProducts() async {
    final result = await _homeApi.getAllProducts();
    switch (result) {
      case NetworkSuccess<List<ProductResponseDto>>():
        return NetworkSuccess<List<ProductEntity>>(
          result.data.map((e) => e.toEntity()).toList(),
        );
      case NetworkError<List<ProductResponseDto>>():
        return NetworkError(result.message);
    }
  }

  @override
  Future<NetworkResult<List<CategoryEntity>>> getCategories() async {
    final result = await _homeApi.getCategories();
    switch (result) {
      case NetworkSuccess<List<CategoryResponseDto>>():
        return NetworkSuccess<List<CategoryEntity>>(
          result.data.map((e) => e.toEntity()).toList(),
        );
      case NetworkError<List<CategoryResponseDto>>():
        return NetworkError(result.message);
    }
  }
}

HomeRemoteDataSourceContract homeDataSourceInjectable() =>
    HomeRemoteDataSourceImp(HomeApi.instance);

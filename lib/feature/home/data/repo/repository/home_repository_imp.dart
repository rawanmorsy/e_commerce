
import 'package:e_commerce/core/network/network.dart';
import 'package:e_commerce/feature/home/data/model/response/category_response_dto.dart';
import 'package:e_commerce/feature/home/data/model/response/product_response_dto.dart';
import 'package:e_commerce/feature/home/data/repo/data_source/home_data_source_contract.dart';
import 'package:e_commerce/feature/home/data/repo/data_source/home_data_source_imp.dart';
import 'package:e_commerce/feature/home/data/repo/repository/home_repository_contract.dart';

class HomeRepositoryImp implements HomeRepositoryContract {
  HomeRepositoryImp(this._homeRemoteDataSourceContract);
final  HomeRemoteDataSourceContract _homeRemoteDataSourceContract;
  @override
  Future<NetworkResult<List<CategoryResponseDto>>> getCategories()=>_homeRemoteDataSourceContract.getCategories();

  @override
  // Future<NetworkResult<List<ProductResponseDto>>> getProductsByCategory(int id) => _homeRemoteDataSourceContract.getProductsByCategory(id);
  
  @override
  Future<NetworkResult<List<ProductResponseDto>>> getAllProducts() => _homeRemoteDataSourceContract.getAllProducts();
}
HomeRepositoryContract homeRepoInjectable() => HomeRepositoryImp(homeDataSourceInjectable());
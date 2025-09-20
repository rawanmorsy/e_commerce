
import 'package:e_commerce/core/network/network.dart';

import 'package:e_commerce/feature/home/domain/entities/category_entity.dart';
import 'package:e_commerce/feature/home/domain/entities/product_entity.dart';
import 'package:e_commerce/feature/home/domain/repo/data_source/home_data_source_contract.dart';
import 'package:e_commerce/feature/home/data/repo/data_source/home_data_source_imp.dart';
import 'package:e_commerce/feature/home/domain/repo/repository/home_repository_contract.dart';

class HomeRepositoryImp implements HomeRepositoryContract {
  HomeRepositoryImp(this._homeRemoteDataSourceContract);
final  HomeRemoteDataSourceContract _homeRemoteDataSourceContract;

  @override
  Future<NetworkResult<List<ProductEntity>>> getAllProducts() =>
      _homeRemoteDataSourceContract.getAllProducts();
   

  @override
  Future<NetworkResult<List<CategoryEntity>>> getCategories() =>
      _homeRemoteDataSourceContract.getCategories();

}
HomeRepositoryContract homeRepoInjectable() => HomeRepositoryImp(homeDataSourceInjectable());
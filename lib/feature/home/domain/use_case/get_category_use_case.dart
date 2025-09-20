import 'package:e_commerce/core/network/network.dart';
import 'package:e_commerce/feature/home/data/repo/repository/home_repository_imp.dart';
import 'package:e_commerce/feature/home/domain/entities/category_entity.dart';
import 'package:e_commerce/feature/home/domain/repo/repository/home_repository_contract.dart';

class GetCategoryUseCase {
  GetCategoryUseCase(this._homeRepositoryContract);
  final HomeRepositoryContract _homeRepositoryContract;

  Future<NetworkResult<List<CategoryEntity>>> call() => _homeRepositoryContract.getCategories();
  
}
GetCategoryUseCase injectGetCategoryUseCase() => GetCategoryUseCase(homeRepoInjectable());
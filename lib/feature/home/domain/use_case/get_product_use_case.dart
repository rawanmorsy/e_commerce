import 'package:e_commerce/core/network/network.dart';
import 'package:e_commerce/feature/home/data/repo/repository/home_repository_imp.dart';
import 'package:e_commerce/feature/home/domain/entities/product_entity.dart';
import 'package:e_commerce/feature/home/domain/repo/repository/home_repository_contract.dart';

class GetProductUseCase {
  GetProductUseCase(this._homeRepositoryContract);
   final HomeRepositoryContract _homeRepositoryContract;

  Future<NetworkResult<List<ProductEntity>>> call() => _homeRepositoryContract.getAllProducts();
}
GetProductUseCase injectableGetProductUseCase() => GetProductUseCase(homeRepoInjectable());
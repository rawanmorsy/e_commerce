import 'package:bloc/bloc.dart';
import 'package:e_commerce/core/network/network.dart';
import 'package:e_commerce/feature/home/domain/entities/category_entity.dart';
import 'package:e_commerce/feature/home/domain/entities/product_entity.dart';
import 'package:e_commerce/feature/home/domain/use_case/get_category_use_case.dart';
import 'package:e_commerce/feature/home/domain/use_case/get_product_use_case.dart';
import 'package:meta/meta.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this._categoryUseCase, this._getProductUseCase)
    : super(HomeInitial());
  final GetCategoryUseCase _categoryUseCase;
  final GetProductUseCase _getProductUseCase;
  List<CategoryEntity> categories = [];
  List<ProductEntity> products = [];
  Future<void> getAllCategories() async {
    emit(HomeCategoryLoading());
    final result = await _categoryUseCase.call();

    switch (result) {
      case NetworkSuccess<List<CategoryEntity>>():
        categories = result.data;

        emit(HomeCategorySuccess());
      case NetworkError<List<CategoryEntity>>():
        emit(HomeCategoryError());
    }
  }

  // Future<void> getProductsByCategory(int id) async {
  //   emit(HomeProductsByCategoryLoading());
  //   final result = await _repository.getProductsByCategory(id);
  //   switch (result) {
  //     case NetworkSuccess<List<ProductResponseDto>>():
  //       emit(HomeProductsByCategorySuccess());
  //       // products = result.data;
  //     case NetworkError<List<ProductResponseDto>>():
  //       emit(HomeProductsByCategoryError());
  //   }
  // }
  Future<void> getAllProducts() async {
    emit(GetAllProductsLoading());
    final result = await _getProductUseCase.call();
    switch (result) {
      case NetworkSuccess<List<ProductEntity>>():
        products = result.data;

        emit(GetAllProductsSuccess());
      case NetworkError<List<ProductEntity>>():
        emit(GetAllProductsError());
    }
  }
}

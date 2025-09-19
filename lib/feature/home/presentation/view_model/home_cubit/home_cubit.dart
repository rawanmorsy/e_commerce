import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:e_commerce/core/network/network.dart';
import 'package:e_commerce/feature/home/data/model/response/category_response_dto.dart';
import 'package:e_commerce/feature/home/data/model/response/product_response_dto.dart';
import 'package:e_commerce/feature/home/data/repo/repository/home_repository_contract.dart';
import 'package:meta/meta.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this._repository) : super(HomeInitial());
  final HomeRepositoryContract _repository;
  List<CategoryResponseDto> categories = [];
  List<ProductResponseDto> products = [];
  Future<void> getAllCategories() async {
    emit(HomeCategoryLoading());
    final result = await _repository.getCategories();

    switch (result) {
      case NetworkSuccess<List<CategoryResponseDto>>():
        categories = result.data;

        emit(HomeCategorySuccess());
      case NetworkError<List<CategoryResponseDto>>():
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
    final result = await _repository.getAllProducts();
    switch (result) {
      case NetworkSuccess<List<ProductResponseDto>>():
        products = result.data;
        log(products.toString());
        emit(GetAllProductsSuccess());

      case NetworkError<List<ProductResponseDto>>():
      log('eee');
        emit(GetAllProductsError());
    }
  }
}

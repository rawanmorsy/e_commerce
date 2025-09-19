import 'dart:convert';
import 'dart:developer';
import 'package:e_commerce/core/network/network.dart';
import 'package:e_commerce/feature/home/data/model/response/category_response_dto.dart';
import 'package:e_commerce/feature/home/data/model/response/product_response_dto.dart';
import 'package:http/http.dart' as http;

class HomeApi {
  ///https://api.escuelajs.co/api/v1/categories/

  HomeApi._();
  static HomeApi? _homeApi;
  static HomeApi get instance => _homeApi ??= HomeApi._();
  Future<NetworkResult<List<CategoryResponseDto>>> getCategories() async {
    try {
      Uri url = Uri.https('api.escuelajs.co', '/api/v1/categories/');
      var response = await http.get(url);
      List<dynamic> json = jsonDecode(response.body);
      List<CategoryResponseDto> list = json
          .map((element) => CategoryResponseDto.fromJson(element))
          .toList();
      return NetworkSuccess(list);
    } catch (e) {
      return NetworkError(e.toString());
    }
  }

  // Future<NetworkResult<List<HomeProductDto>>> getProductsByCategory(
  //   int id,
  // ) async {
  //   try {
  //     //https://api.escuelajs.co/api/v1/categories/:categoryId/products
  //     Uri url = Uri.https(
  //       "api.escuelajs.co",
  //       "/api/v1/categories/$id/products",
  //     );
  //     var response = await http.get(url);
  //     List<dynamic> json = jsonDecode(response.body);
  //     List<HomeProductDto> list = json
  //         .map((element) => HomeProductDto.fromJson(element))
  //         .toList();
  //     return NetworkSuccess(list);
  //   } catch (e) {
  //     return NetworkError(e.toString());
  //   }
  // }

 
  Future<NetworkResult<List<ProductResponseDto>>> getAllProducts() async {
    try {
      //https://api.escuelajs.co/api/v1/products/
      Uri url = Uri.https('api.escuelajs.co', '/api/v1/products/');
      var response = await http.get(url);
      var json = jsonDecode(response.body) as List;
      List<ProductResponseDto> list = json
          .map((element) => ProductResponseDto.fromJson(element))
          .toList();

      return NetworkSuccess(list);
    } catch (e) {
      log(e.toString());
      return NetworkError(e.toString());
    }
  }
}

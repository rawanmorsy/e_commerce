import 'package:e_commerce/feature/home/data/model/response/category_response_dto.dart';

class ProductResponseDto {
  int? id;
  String? title;
  String? slug;
  int? price;
  String? description;
  CategoryResponseDto ? category;
  List<String>? images;
  String? creationAt;
  String? updatedAt;

  ProductResponseDto({
    this.id,
    this.title,
    this.slug,
    this.price,
    this.description,
    this.category,
    this.images,
    this.creationAt,
    this.updatedAt,
  });

  ProductResponseDto.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    slug = json['slug'];
    price = json['price'];
    description = json['description'];
    category = json['category'] != null
        ? CategoryResponseDto.fromJson(json['category'])
        : null;
    images = json['images'].cast<String>();
    creationAt = json['creationAt'];
    updatedAt = json['updatedAt'];
  }

}
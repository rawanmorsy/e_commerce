
import 'package:e_commerce/feature/home/domain/entities/category_entity.dart';

class ProductEntity {
 final int id;
 final String title;
 final String slug;
 final int price;
 final String description;
 final CategoryEntity  category;
 final List<String> images;
 

 const ProductEntity({
    this.id=0,
    this.title='',
    this.slug='',
    this.price=0,
    this.description='',
    this.category= const CategoryEntity(),
    this.images=const[],
   
  });

  

}
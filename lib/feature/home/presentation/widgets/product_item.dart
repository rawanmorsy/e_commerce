import 'package:e_commerce/core/constants/app_assets.dart';
import 'package:e_commerce/feature/home/data/model/response/product_response_dto.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
class ProductItemWidget extends StatelessWidget {
  const ProductItemWidget({
    super.key,
    required this.product,
    this.onTap,
    this.addToFavorite,
  });
  final void Function()? onTap;
  final void Function()? addToFavorite;
  final ProductResponseDto product;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withAlpha(50),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3), 
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 8,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  ),
                  clipBehavior: Clip.antiAlias,
                  child: CachedNetworkImage(
                    height: 238,
                    fit: BoxFit.cover,
                    imageUrl: product.images?.first ?? AppAssets.noImage,
                    placeholder: (context, url) =>
                        Center(child: SizedBox.shrink()),
                    errorWidget: (context, url, error) =>
                        Image.network(AppAssets.noImage),
                  ),
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: IconButton(
                    style: IconButton.styleFrom(
                      backgroundColor: Colors.white,
                      shape: CircleBorder(),
                    ),
                    icon: Icon(Icons.favorite, color: Colors.red),
                    onPressed: addToFavorite,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8, right: 8),
              child: Text(
                product.title ?? '',
                style: TextStyle(
                  color: Color(0xff212121),
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8, right: 8),
              child: RichText(
                text: TextSpan(
                  text: "EGP",
                  style: TextStyle(
                    color: Color(0xff212121),
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                  children: [
                    TextSpan(
                      text: " ${product.price}",
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
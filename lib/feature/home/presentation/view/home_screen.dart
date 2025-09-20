
import 'package:e_commerce/feature/home/domain/entities/category_entity.dart';
import 'package:e_commerce/feature/home/domain/entities/product_entity.dart';
import 'package:e_commerce/feature/home/presentation/view_model/home_cubit/home_cubit.dart';
import 'package:e_commerce/feature/home/presentation/widgets/product_item.dart';
import 'package:e_commerce/feature/home/presentation/widgets/tab_container_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  static const String routeName = 'HomeScreen';

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        List<CategoryEntity> categories = context
            .read<HomeCubit>()
            .categories;
        List<ProductEntity> products = context.read<HomeCubit>().products;
        return Padding(
          padding: EdgeInsetsGeometry.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 16),
              Text.rich(
                TextSpan(
                  text: 'Hi !,\n',
                  style: TextStyle(
                    color: Color(0xff212121),
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                  ),
                  children: [
                    TextSpan(
                      text: 'Let’s start your shopping',
                      style: TextStyle(
                        color: Color(0xff212121),
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16),
              Text(
                "Categories",
                style: TextStyle(
                  color: Color(0xff212121),
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 5),
              //! getCategories
              TabContainerWidget(
                categories: categories,
                onTap: (index) async {
                  // await context.read<HomeCubit>().getProductsByCategory(
                  //   categories[index].id!,
                  // );
                  // context.read<HomeCubit>().getProductsByCategory(
                  //   categories[index].id ?? 1,
                  // );
                },
              ),
              SizedBox(height: 16),
              if (products.isNotEmpty)
                Expanded(
                  child: Skeletonizer(
                    enabled: state is GetAllProductsLoading,
                    child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 30,
                        mainAxisSpacing: 18,
                        childAspectRatio: 163 / 290,
                      ),
                      itemCount: products.length,
                      itemBuilder: (context, index) {
                        return ProductItemWidget(product: products[index]);
                      },
                    ),
                  ),
                ),
              
           
                

            ],
          ),
        );
      },
    );
  }
}

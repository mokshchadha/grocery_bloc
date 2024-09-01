import 'package:flutter/material.dart';
import 'package:grocery_bloc/features/home/bloc/home_bloc.dart';
import 'package:grocery_bloc/features/home/models/home_product_data_model.dart';

class ProductTile extends StatelessWidget {
  final ProductDataModel product;
  final HomeBloc homeBloc;
  const ProductTile({Key? key, required this.product, required this.homeBloc})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.network(
        product.imageUrl,
        width: 50,
        height: 50,
        fit: BoxFit.cover,
      ),
      title: Text(product.name),
      subtitle: Text(product.description),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            '\$${product.price.toStringAsFixed(2)}',
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          IconButton(
            icon: const Icon(Icons.favorite_border),
            onPressed: () {
              homeBloc.add(HomeProductWishlistButtonClickedEvent(
                  clickedProduct: product));
            },
          ),
          IconButton(
            icon: const Icon(Icons.shopping_cart_outlined),
            onPressed: () {
              homeBloc.add(HomeProductCartButtonClickedEvent());
            },
          ),
        ],
      ),
      onTap: () {
        // Handle tile tap, e.g., navigate to a product detail page
      },
    );
  }
}

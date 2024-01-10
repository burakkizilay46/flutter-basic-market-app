// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:market/core/extensions/context_extansion.dart';

import 'package:market/feature/market/model/product_model.dart';

class ProductDetailView extends StatelessWidget {
  final ProductModel? product;
  ProductDetailView({
    Key? key,
    this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('${product!.category}'.toUpperCase()),
        ),
        body: Padding(
          padding: const EdgeInsets.all(48.0),
          child: ListView(
            children: [
              Image.network('${product!.image}'),
              const Divider(color: Colors.black),
              Text('${product!.title}', style: context.bigTextStyle),
              Text('${product!.description}', style: context.normalTextStyle),
              Text(
                '\$${product!.price}',
                style: context.bigTextStyle.copyWith(fontSize: 64),
              ),
            ],
          ),
        ));
  }
}

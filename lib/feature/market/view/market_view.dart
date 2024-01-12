import 'package:flutter/material.dart';
import 'package:market/core/extensions/context_extansion.dart';
import 'package:market/feature/home/provider/home_provider.dart';
import 'package:market/feature/market/model/product_model.dart';
import 'package:market/feature/market/provider/market_provider.dart';
import 'package:provider/provider.dart';

class MarketView extends StatefulWidget {
  const MarketView({Key? key}) : super(key: key);

  @override
  State<MarketView> createState() => _MarketViewState();
}

class _MarketViewState extends State<MarketView> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: MarketProvider(),
      child: Scaffold(
        body: Consumer<MarketProvider>(
          builder: (context, marketProvider, child) {
            if (marketProvider.isLoading) {
              return const Center(child: CircularProgressIndicator());
            } else {
              return Column(
                children: [
                  SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: Text('Products'.toUpperCase(), textAlign: TextAlign.start, style: context.bigTextStyle)),
                  const Divider(color: Colors.black),
                  Flexible(
                    flex: 34,
                    child: productsListView(marketProvider),
                  ),
                ],
              );
            }
          },
        ),
      ),
    );
  }

  GridView productsListView(MarketProvider marketProvider) {
    return GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemCount: marketProvider.products.length,
        itemBuilder: (context, index) {
          ProductModel item = marketProvider.products[index];
          return GestureDetector(
            onTap: () => marketProvider.navigateDetailPage(marketProvider.products[index]),
            child: _productsCard(item, index, context),
          );
        });
  }

  Card _productsCard(ProductModel item, int index, BuildContext context) {
    return Card(
      child: ListTile(
        title: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                height: 96,
                child: Image.network(
                  item.image.toString(),
                  errorBuilder: (context, error, stackTrace) {
                    return const Placeholder();
                  },
                ),
              ),
              Text(
                '${item.title}',
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                '${item.price}',
                style: context.bigTextStyle.copyWith(fontSize: 16),
              ),
              Container(
                decoration:
                    BoxDecoration(color: context.appColor.withOpacity(0.6), borderRadius: BorderRadius.circular(32)),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                        onTap: () => context.read<HomeProvider>().removeToBasket(item),
                        child: const Icon(Icons.remove)),
                    Text("${context.watch<HomeProvider>().basketProducts[item] ?? 0}"),
                    GestureDetector(
                        onTap: () => context.read<HomeProvider>().addToBasket(item), child: const Icon(Icons.add)),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

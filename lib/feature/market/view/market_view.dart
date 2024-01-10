import 'package:flutter/material.dart';
import 'package:market/core/extensions/context_extansion.dart';
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
              return GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                  itemCount: marketProvider.products.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            SizedBox(
                              height: 96,
                              child: Image.network(
                                marketProvider.products[index].image,
                                errorBuilder: (context, error, stackTrace) {
                                  // Handle image loading errors, e.g., display a placeholder
                                  return const Placeholder();
                                },
                              ),
                            ),
                            Text(
                              '${marketProvider.products[index].title}',
                              maxLines: 2,
                            ),
                            Text(
                              '${marketProvider.products[index].price}',
                              style: context.bigTextStyle.copyWith(fontSize: 16),
                            ),
                          ],
                        ),
                      ),
                    );
                  });
            }
          },
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:market/core/extensions/context_extansion.dart';
import 'package:market/feature/home/provider/home_provider.dart';
import 'package:provider/provider.dart';

class BasketView extends StatelessWidget {
  const BasketView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Flexible(
            flex: 18,
            child: ListView.builder(
                itemCount: context.watch<HomeProvider>().basketItems.length,
                itemBuilder: (context, index) {
                  final item = context.watch<HomeProvider>().basketItems[index];
                  return Card(
                    child: Padding(
                      padding: EdgeInsets.all(16),
                      child: Row(
                        children: [
                          SizedBox(height: 128, width: 128, child: Image.network("${item.image}")),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(width: 160, child: Text("${item.title}")),
                              SizedBox(height: 32),
                              Text(
                                "${context.watch<HomeProvider>().basketProducts[item]} * \$${item.price}",
                              ),
                              Text(
                                "\$${context.watch<HomeProvider>().basketProducts[item]! * item.price!} ",
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                }),
          ),
          Flexible(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  "Total Price: \$${context.watch<HomeProvider>().basketTotalPrice}",
                  style: context.bigTextStyle,
                ),
              )),
        ],
      ),
    );
  }
}

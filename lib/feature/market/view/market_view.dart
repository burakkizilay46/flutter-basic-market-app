import 'package:dio/dio.dart';
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
  late Future<List<dynamic>> products;

  Future<List<dynamic>> getProducts() async {
    final dio = Dio();
    final response = await dio.get('https://fakestoreapi.com/products');
    return response.data;
  }

  @override
  void initState() {
    super.initState();
    products = getProducts();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => MarketProvider(), // You might want to use an existing instance here
      child: Scaffold(
        body: FutureBuilder<List<dynamic>>(
          future: products,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              // Provide a user-friendly error message
              return Center(child: Text('Failed to load products. Please try again.'));
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return const Center(child: Text('No data available'));
            } else {
              return GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                itemCount: snapshot.data!.length,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      Provider.of<MarketProvider>(context, listen: false).navigateDetailPage();
                    },
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            SizedBox(
                              height: 96,
                              child: Image.network(
                                snapshot.data![index]['image'],
                                errorBuilder: (context, error, stackTrace) {
                                  // Handle image loading errors, e.g., display a placeholder
                                  return const Placeholder();
                                },
                              ),
                            ),
                            Text(
                              snapshot.data![index]['title'].toString(),
                              maxLines: 2,
                            ),
                            Text(
                              '\$${snapshot.data![index]['price']}',
                              style: context.bigTextStyle.copyWith(fontSize: 16),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}

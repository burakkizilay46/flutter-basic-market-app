import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:market/core/extensions/context_extansion.dart';

class MarketView extends StatefulWidget {
  const MarketView({super.key});

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
    // TODO: implement initState
    super.initState();
    products = getProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<dynamic>>(
        future: products,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
                child: CircularProgressIndicator()); // Show a loading indicator while data is being fetched
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Text('No data available'); // Handle the case where there is no data
          } else {
            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              itemCount: snapshot.data!.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  child: Padding(
                    padding: const EdgeInsetsDirectional.all(8),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SizedBox(height: 96, child: Image.network(snapshot.data![index]['image'])),
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
                );
              },
            );
          }
        },
      ),
    );
  }
}

/* Text(snapshot.data![index]['title'].toString()); */

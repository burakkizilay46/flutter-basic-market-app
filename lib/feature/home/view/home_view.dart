import 'package:flutter/material.dart';
import 'package:market/feature/basket/view/basket_view.dart';
import 'package:market/feature/home/provider/home_provider.dart';
import 'package:market/feature/market/view/market_view.dart';
import 'package:provider/provider.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    const List<Widget> _widgetOptions = <Widget>[MarketView(), BasketView()];

    return ChangeNotifierProvider(create: (_) => HomeProvider(), child: _HomeContent(widgetOptions: _widgetOptions));
  }
}

class _HomeContent extends StatelessWidget {
  const _HomeContent({
    super.key,
    required List<Widget> widgetOptions,
  }) : _widgetOptions = widgetOptions;

  final List<Widget> _widgetOptions;

  @override
  Widget build(BuildContext context) {
    final homeProvider = Provider.of<HomeProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Market"),
      ),
      body: Center(
        child: _widgetOptions.elementAt(homeProvider.pageIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(label: 'Market', icon: Icon(Icons.home_outlined)),
          BottomNavigationBarItem(label: 'Sepet', icon: Icon(Icons.shopping_basket_outlined)),
        ],
        currentIndex: homeProvider.pageIndex,
        onTap: (index) => homeProvider.setPageIndex(index),
      ),
    );
  }
}

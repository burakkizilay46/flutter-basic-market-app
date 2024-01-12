import 'package:flutter/material.dart';
import 'package:market/core/extensions/context_extansion.dart';
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
    const List<Widget> widgetOptions = <Widget>[MarketView(), BasketView()];

    return ChangeNotifierProvider(
      create: (_) => HomeProvider(),
      child: const _HomeContent(widgetOptions: widgetOptions),
    );
  }
}

class _HomeContent extends StatelessWidget {
  const _HomeContent({
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
        child: Padding(
          padding: EdgeInsetsDirectional.all(8),
          child: _widgetOptions.elementAt(homeProvider.pageIndex),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          const BottomNavigationBarItem(label: 'Market', icon: Icon(Icons.home_outlined)),
          BottomNavigationBarItem(
              label: 'Sepet',
              icon: Stack(
                children: [
                  const Icon(Icons.shopping_basket_outlined),
                  _countBasketSize(context),
                ],
              )),
        ],
        currentIndex: homeProvider.pageIndex,
        onTap: (index) => homeProvider.setPageIndex(index),
      ),
    );
  }

  Widget _countBasketSize(BuildContext context) {
    return Visibility(
      visible: !(context.watch<HomeProvider>().basketCount == 0),
      child: Positioned(
        right: 0,
        top: 0,
        child: CircleAvatar(
          backgroundColor: context.appColor,
          radius: 5,
          child: Center(
            child: Text(
              '${context.watch<HomeProvider>().basketCount}',
              style: context.bigTextStyle.copyWith(fontSize: 8),
            ),
          ),
        ),
      ),
    );
  }
}

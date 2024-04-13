import 'package:flutter/material.dart';

import '../account/account_view.dart';
import '../home/home_view.dart';
import '../our_book/out_books_view.dart';
import '../search/search_view.dart';
import '../cart/cart.dart';
import '../our_stores/our_stores.dart'; // Import the OurStoresView

class MainTabView extends StatefulWidget {
  const MainTabView({Key? key}) : super(key: key);

  @override
  State<MainTabView> createState() => _MainTabViewState();
}

GlobalKey<ScaffoldState> sideMenuScaffoldKey = GlobalKey<ScaffoldState>();

class _MainTabViewState extends State<MainTabView> with TickerProviderStateMixin {
  TabController? controller;

  int selectMenu = 0;

  List menuArr = [
    {"name": "Home", "icon": Icons.home},
    {"name": "Our Books", "icon": Icons.book},
    {"name": "Our Stores", "icon": Icons.storefront},
    {"name": "Careers", "icon": Icons.business_center},
    {"name": "Sell With Us", "icon": Icons.attach_money},
    {"name": "Newsletter", "icon": Icons.newspaper},
    {"name": "Pop-up Leasing", "icon": Icons.open_in_new},
    {"name": "Account", "icon": Icons.account_circle}
  ];

  @override
  void initState() {
    controller = TabController(length: 4, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      key: sideMenuScaffoldKey,
      endDrawer: Drawer(
        backgroundColor: Colors.transparent,
        elevation: 0,
        width: media.width * 0.8,
        child: Container(
          // Drawer content
        ),
      ),
      body: TabBarView(controller: controller, children: [
        const HomeView(),
        const SearchView(),
         OurStoresView(), // Added OurStoresView here
        const CartView(),
      ]),
      bottomNavigationBar: BottomAppBar(
        color: Colors.blue, // Adjust color as needed
        child: TabBar(
          controller: controller,
          indicatorColor: Colors.transparent,
          labelColor: Colors.white,
          unselectedLabelColor: Colors.white54,
          tabs: const [
            Tab(icon: Icon(Icons.home), text: "Home"),
            Tab(icon: Icon(Icons.search), text: "Search"),
            Tab(icon: Icon(Icons.storefront), text: "Our Stores"),
            Tab(icon: Icon(Icons.shopping_bag), text: "Cart"),
          ],
        ),
      ),
    );
  }
}

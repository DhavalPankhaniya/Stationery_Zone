import 'package:flutter/material.dart';
import 'package:flutter_stationery_zone/src/admin/pages/add_stationery_item.dart';
import 'package:flutter_stationery_zone/src/scoped-model/main_model.dart';
import '../pages/home_page.dart';
import '../pages/order_page.dart';
import '../pages/explore_page.dart';
import '../pages/profile_page.dart';

class MainScreen extends StatefulWidget {
  final MainModel model;

  MainScreen({this.model});

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentTab = 0;

  // Pages
  HomePage homePage;
  OrderPage orderPage;
  FavoritePage favoritePage;
  ProfilePage profilePage;

  List<Widget> pages;
  Widget currentPage;

  @override
  void initState() {
    homePage = HomePage();
    orderPage = OrderPage();
    favoritePage = FavoritePage(model: widget.model);
    profilePage = ProfilePage();
    pages = [homePage, favoritePage, orderPage, profilePage];

    currentPage = homePage;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.black),
          title: Text(
            currentTab == 0
                ? "Stationery App"
                : currentTab == 1
                    ? "All  Items"
                    : currentTab == 2 ? "Orders" : "Profile",
            style: TextStyle(
                color: Colors.black,
                fontSize: 16.0,
                fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          actions: <Widget>[
            IconButton(
                icon: Icon(
                  Icons.notifications_none,
                  // size: 30.0,
                  color: Theme.of(context).primaryColor,
                ),
                onPressed: () {}),
            IconButton(
              icon: _buildShoppingCart(),
              onPressed: () {},
            )
          ],
        ),
        drawer: Drawer(
          child: Column(
            children: <Widget>[
              ListTile(
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => AddFoodItem()));
                },
                leading: Icon(Icons.list),
                title: Text(
                  "Add Stationery Item",
                  style: TextStyle(fontSize: 16.0),
                ),
              )
            ],
          ),
        ),
        resizeToAvoidBottomInset: false,
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentTab,
          onTap: (index) {
            setState(() {
              currentTab = index;
              currentPage = pages[index];
            });
          },
          type: BottomNavigationBarType.fixed,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
              ),
              title: Text("Home"),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.explore,
              ),
              title: Text("Explore"),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.shopping_cart,
              ),
              title: Text("Orders"),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
              ),
              title: Text("Profile"),
            ),
          ],
        ),
        body: currentPage,
      ),
    );
  }

  Widget _buildShoppingCart() {
    return Stack(
      children: <Widget>[
        Icon(
          Icons.shopping_cart,
          // size: 30.0,
          color: Theme.of(context).primaryColor,
        ),
        Positioned(
          top: 0.0,
          right: 0.0,
          child: Container(
            height: 12.0,
            width: 12.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              color: Colors.red,
            ),
            child: Center(
              child: Text(
                "1",
                style: TextStyle(
                  fontSize: 12.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'pages/sigin_page.dart';
import 'package:flutter_stationery_zone/src/scoped-model/main_model.dart';
import 'package:flutter_stationery_zone/src/screens/main_screen.dart';
import 'package:scoped_model/scoped_model.dart';

class App extends StatelessWidget {
  final MainModel mainModel = MainModel();

  @override
  Widget build(BuildContext context) {
    return ScopedModel<MainModel>(
      model: mainModel,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Stationey Zone",
        theme: ThemeData(primaryColor: Colors.blueAccent),
        routes: {
          // "/": (BuildContext context) => SignInPage(),
          // "/mainscreen":
          "/": (BuildContext context) => MainScreen(
                model: mainModel,
              ),
        },
      ),
    );
  }
}

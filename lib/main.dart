import 'package:flutter/material.dart';
import 'package:flutter_app/util/Constants.dart';
import 'package:provider/provider.dart';
import './screen/LoginScreen.dart';
import './screen/DashboardScreen.dart';
import 'model/Person.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: Person(),
        ),
      ],
      child: Consumer<Person>(
        builder: (ctx, person, _) => MaterialApp(
            title: Constants.TITLE,
            theme: ThemeData(
              primarySwatch: Colors.blue,
              accentColor: Colors.deepOrange,
              //fontFamily: 'Lato',
            ),
            home: person.isAuth ? DashboardScreen() : LoginScreen(),
           // debugShowCheckedModeBanner: false,
            routes: {
              LoginScreen.routeName: (ctx) => LoginScreen(),
              DashboardScreen.routeName: (ctx) => DashboardScreen(),
            }),
      ),
    );
  }
}

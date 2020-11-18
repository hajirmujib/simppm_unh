import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simppm_unh/provider/artikelProvider.dart';
import 'package:simppm_unh/provider/authProvider.dart';
import 'package:simppm_unh/provider/providerBottomBar.dart';
import 'package:simppm_unh/provider/userProvider.dart';
import 'package:simppm_unh/ui/bottomBar.dart';

import 'package:simppm_unh/ui/loginView.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  AuthProvider auth = AuthProvider();

  @override
  Widget build(BuildContext context) {
    // final AuthProvider auth = Provider.of<AuthProvider>(context);
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(create: (_) => UserProvider()),
        ChangeNotifierProvider(create: (_) => BottomNavigationBarProvider()),
        ChangeNotifierProvider(create: (_) => ArtikelProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'SIMPPM UNH',
        theme: ThemeData(
          primarySwatch: Colors.purple,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        // home: ChangeNotifierProvider<BottomNavigationBarProvider>(
        //     child: BottomAppBarUi(),
        //     create: (BuildContext context) => BottomNavigationBarProvider()),
        home: LoginView(),

        routes: {
          '/bottomBar': (context) => BottomAppBarUi(),
          '/login': (context) => LoginView(),
        },
      ),
    );
  }
}

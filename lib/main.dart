import 'package:flutter/material.dart';
import 'splashscreen.dart';

void main() {

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Keep or remove the debug banner based on your preference
      debugShowCheckedModeBanner: false,
      title: 'Neway',
      home: SplashScreen(),
      theme: ThemeData(
        primarySwatch: Colors.cyan,
        pageTransitionsTheme: PageTransitionsTheme(
          builders: {
            TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
            TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
          },
        ),
      ),
    );
  }
}

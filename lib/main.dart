import 'package:browser/screen/provider/webprovider.dart';
import 'package:browser/screen/view/AppPage.dart';
import 'package:browser/screen/view/HomePage.dart';
import 'package:browser/screen/view/SearchPage.dart';
import 'package:browser/screen/view/WebPage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
void main()
{
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => WebProvider(),),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          '/':(context) => HomePage(),
          's':(context) => SearchPage(),
          'a':(context) => AppPage(),
          'w':(context) => WebPage(),
        },
      ),
    )
  );
}
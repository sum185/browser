import 'package:browser/screen/provider/webprovider.dart';
import 'package:browser/screen/view/AppPage.dart';
import 'package:browser/screen/view/SearchPage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  WebProvider? providerT;
  WebProvider? providerF;
  List<Widget> t1=[SearchPage(),AppPage()];
  @override
  Widget build(BuildContext context) {
    providerT =Provider.of<WebProvider>(context,listen: true);
    providerF =Provider.of<WebProvider>(context,listen: false);
    return SafeArea(
        child: Scaffold(
          body: Center(
            child: t1.elementAt(providerT!.i),
          ),
          bottomNavigationBar: BottomNavigationBar(
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.search_outlined),label: "Search",),
              BottomNavigationBarItem(icon: Icon(Icons.app_shortcut),label: "Apps")
            ],
            currentIndex: providerT!.i,
            selectedItemColor: Colors.red,
            onTap: (value){
              providerF!.selectB(value);
            },
          ),
        )
    );
  }
}

import 'package:browser/screen/provider/webprovider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AppPage extends StatefulWidget {
  const AppPage({Key? key}) : super(key: key);

  @override
  State<AppPage> createState() => _AppPageState();
}

class _AppPageState extends State<AppPage> {
  WebProvider? providerT;
  WebProvider? providerF;

  @override
  Widget build(BuildContext context) {
    providerT = Provider.of<WebProvider>(context, listen: true);
    providerF = Provider.of<WebProvider>(context, listen: false);
    return SafeArea(
        child: Scaffold(
      body: Column(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Education",
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.amber,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3, crossAxisSpacing: 10),
              itemCount: providerF!.s1.length,
              itemBuilder: (context, index) => Column(
                children: [
                  InkWell(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        height: 80,
                        width: 100,
                        color: Colors.red,
                        child: Image.asset("${providerF!.s1[index].image}",fit: BoxFit.cover,)
                      ),
                    ),
                    onTap: (){
                      providerF!.changeIndex(index, providerF!.s1);
                      Navigator.pushNamed(context, 'w');
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "${providerF!.s1[index].name}",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
          ),
          Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "OTT Platform ",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.amber,
                      fontSize: 20),
                ),
              )),
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3, crossAxisSpacing: 10),itemCount: providerF!.o1.length,
              itemBuilder: (context, index) => Column(
                children: [
                  InkWell(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        height: 80,
                        width: 80,
                        color: Colors.red,
                        child: Image.asset("${providerF!.o1[index].image}",fit: BoxFit.cover,),
                      ),
                    ),
                    onTap: (){
                      providerF!.changeIndex(index, providerF!.o1);
                      Navigator.pushNamed(context, 'w');
                    },
                  ),
                  SizedBox(height: 10,),
                  Text("${providerF!.o1[index].name}",style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),)
                ],
              ),
            ),
          ),
        ],
      ),
    ));
  }
}

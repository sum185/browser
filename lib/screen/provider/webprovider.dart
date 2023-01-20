import 'package:browser/screen/model/webModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class WebProvider extends ChangeNotifier{
  int i=0;
  int i2=0;
  String searchData= "https://www.google.com/";
  InAppWebViewController? inAppWebViewController;
  double progress=0.0;
  double progress2=0.0;
  List<WebProvider> t1 = [];
  void selectB(int index){
    i=index;
    notifyListeners();
  }
  void changeSearch(String data)
  {
    searchData=data;
    notifyListeners();
  }
  void changeProgress(double data)
  {
    progress=data;
    notifyListeners();
  }

  List<WebModel> s1=[
    WebModel(image: "asset/image/wiki.png",name: "Wikipedia",url: "https://www.wikipedia.org/"),
    WebModel(image: "asset/image/w3s.png",name: "W3schools",url: "https://www.w3schools.com/"),
    WebModel(image: "asset/image/java.png",name: "JavaTpoint",url: "https://www.javatpoint.com/"),
    WebModel(image: "asset/image/tut.png",name: "Tutorialspoint",url: "https://www.tutorialspoint.com/"),
  ];
  List<WebModel> o1=[
    WebModel(image: "asset/image/net.png",name: "Netflix",url: "https://www.netflix.com/"),
    WebModel(image: "asset/image/pri.png",name: "Primevideo",url: "https://www.primevideo.com/"),
    WebModel(image: "asset/image/son.png",name: "Sonyliv",url: "https://www.sonyliv.com/"),
    WebModel(image: "asset/image/dis.png",name: "Hotstar",url: "https://www.hotstar.com/in"),
  ];
  List<WebModel> selectApp = [];
  void changeIndex(index,select)
  {
    i2=index;
    selectApp=select;
    notifyListeners();
  }
  void changeProgress2(double data)
  {
    progress2=data;
    notifyListeners();
  }
}
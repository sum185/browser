import 'package:browser/screen/provider/webprovider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:provider/provider.dart';

class WebPage extends StatefulWidget {
  const WebPage({Key? key}) : super(key: key);

  @override
  State<WebPage> createState() => _WebPageState();
}

class _WebPageState extends State<WebPage> {
  WebProvider? providerT;
  WebProvider? providerF;
  @override
  Widget build(BuildContext context) {
    providerT =Provider.of<WebProvider>(context,listen: true);
    providerF =Provider.of<WebProvider>(context,listen: false);
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.amber,
            title: Text("${providerF!.selectApp[Provider.of<WebProvider>(context,listen: false).i2].name}",style: TextStyle(color: Colors.black),),
            centerTitle: true,
          ),
          body: Column(
            children: [
              LinearProgressIndicator(
                value: providerF!.progress2,
              ),
              Expanded(
                child: InAppWebView(
                  initialUrlRequest: URLRequest(
                    url: Uri.parse("${Provider.of<WebProvider>(context,listen: true).selectApp[Provider.of<WebProvider>(context,listen: true).i2].url}")
                  ),
                  onProgressChanged: (controller,progress2){
                    providerF!.changeProgress2(progress2/100);
                  },
                ),
              ),
            ],
          ),
        )
    );
  }
}

import 'package:browser/screen/provider/webprovider.dart';
import 'package:browser/utils/sharedPref.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  WebProvider? providerT;
  WebProvider? providerF;
  TextEditingController txtSearch = TextEditingController();
  PullToRefreshController? pullToRefreshController;
  List<String> urls = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pullToRefreshController = PullToRefreshController(onRefresh: () async {
      Provider.of<WebProvider>(context, listen: false)
          .inAppWebViewController!
          .loadUrl(
              urlRequest: URLRequest(
                  url: await Provider.of<WebProvider>(context, listen: false)
                      .inAppWebViewController!
                      .getUrl()));
    });
    getBookMark();
  }

  void getBookMark() async {
    urls = (await readBookMarkUrls())!;
  }

  @override
  Widget build(BuildContext context) {
    providerT = Provider.of<WebProvider>(context, listen: true);
    providerF = Provider.of<WebProvider>(context, listen: false);
    return SafeArea(
        child: Scaffold(
      body: Column(
        children: [
          Container(
            color: Colors.amber.shade700,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 40,
                padding: EdgeInsets.symmetric(horizontal: 5),
                alignment: Alignment.center,
                width: double.infinity,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    IconButton(
                        onPressed: () {
                          providerF!.inAppWebViewController!.goBack();
                        },
                        icon: Icon(Icons.arrow_back)),
                    IconButton(
                        onPressed: () {
                          providerF!.inAppWebViewController!.goForward();
                        },
                        icon: Icon(Icons.arrow_forward)),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                          controller: txtSearch,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                    IconButton(
                        onPressed: () async {
                          Uri? uri = await providerF!.inAppWebViewController!
                              .getOriginalUrl();
                          urls.add("$uri");
                          addBookMark(urls);
                          getBookMark();
                        },
                        icon: Icon(Icons.bookmark_add)),
                    IconButton(
                        onPressed: () {
                          providerF!.changeSearch(txtSearch.text);
                          providerF!.inAppWebViewController!.loadUrl(
                              urlRequest: URLRequest(
                                  url: Uri.parse(
                                      "https://www.google.com/search?q=${txtSearch.text}")));
                        },
                        icon: Icon(Icons.search_rounded)),
                    PopupMenuButton(
                      itemBuilder: (context) {
                        return urls
                            .map((e) => PopupMenuItem(
                                  child: InkWell(
                                      onTap: () {
                                        showDialog(
                                          context: context,
                                          builder: (context) {
                                            return AlertDialog(
                                              title: Text("Select Any One"),
                                              actions: [
                                                Row(
                                                  children: [
                                                    ElevatedButton(
                                                        onPressed: () {
                                                          providerF!
                                                              .inAppWebViewController!
                                                              .loadUrl(
                                                                  urlRequest:
                                                                      URLRequest(
                                                                          url: Uri.parse(
                                                                              e)));
                                                          Navigator.pop(
                                                              context);
                                                        },
                                                        child: Text("Open")),
                                                    SizedBox(
                                                      width: 20,
                                                    ),
                                                    ElevatedButton(
                                                        onPressed: () async {
                                                          Uri? uri = await providerF!
                                                              .inAppWebViewController!
                                                              .getOriginalUrl();
                                                          urls.remove(e);
                                                          addBookMark(urls);
                                                          getBookMark();
                                                          Navigator.pop(
                                                              context);
                                                        },
                                                        child: Text("Remove"))
                                                  ],
                                                )
                                              ],
                                            );
                                          },
                                        );
                                      },
                                      child: Text("$e")),
                                ))
                            .toList();
                      },
                    )
                  ],
                ),
                decoration: BoxDecoration(
                    color: Colors.amber.shade100,
                    borderRadius: BorderRadius.circular(30)),
              ),
            ),
          ),
          LinearProgressIndicator(
            value: providerF!.progress,
          ),
          Expanded(
            child: InAppWebView(
              initialUrlRequest:
                  URLRequest(url: Uri.parse("https://www.google.com/")),
              onWebViewCreated: (controller) {
                providerF!.inAppWebViewController = controller;
              },
              onProgressChanged: (controller, progress) {
                providerF!.changeProgress(progress / 100);
              },
              pullToRefreshController: pullToRefreshController,
            ),
          )
        ],
      ),
    ));
  }
}

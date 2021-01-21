import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    var twitter_url =
        """<blockquote class="twitter-tweet" data-theme="light"><p lang="en" dir="ltr">just setting up my twttr</p>&mdash; jack (@jack) <a href="https://twitter.com/jack/status/20?ref_src=twsrc%5Etfw">March 21, 2006</a></blockquote> <script async src="https://platform.twitter.com/widgets.js" charset="utf-8"></script>""";

    var linkedin_url =
        """<iframe src="https://www.linkedin.com/embed/feed/update/urn:li:share:6757974279263920128" height="771" width="${MediaQuery.of(context).size.width}, child: null)" frameborder="0" allowfullscreen="" title="Embedded post"></iframe>""";

    List<Widget> webViewList = [
      Expanded(
        child: Container(
          height: MediaQuery.of(context).size.height / 4,
          width: MediaQuery.of(context).size.width,
          child: WebViewExample(
            url: twitter_url,
          ),
        ),
      ),
      Expanded(
        child: Container(
          height: MediaQuery.of(context).size.height / 2,
          width: MediaQuery.of(context).size.width,
          child: WebViewExample(
            url: linkedin_url,
          ),
        ),
      ),
      Expanded(
        child: Container(
          height: MediaQuery.of(context).size.height / 4,
          width: MediaQuery.of(context).size.width,
          child: WebViewExample(
            url: twitter_url,
          ),
        ),
      ),
      Expanded(
        child: Container(
          height: MediaQuery.of(context).size.height / 2,
          width: MediaQuery.of(context).size.width,
          child: WebViewExample(
            url: linkedin_url,
          ),
        ),
      ),
      Expanded(
        child: Container(
          height: MediaQuery.of(context).size.height / 4,
          width: MediaQuery.of(context).size.width,
          child: WebViewExample(
            url: twitter_url,
          ),
        ),
      ),
      Expanded(
        child: Container(
          height: MediaQuery.of(context).size.height / 2,
          width: MediaQuery.of(context).size.width,
          child: WebViewExample(
            url: linkedin_url,
          ),
        ),
      ),
      Expanded(
        child: Container(
          height: MediaQuery.of(context).size.height / 4,
          width: MediaQuery.of(context).size.width,
          child: WebViewExample(
            url: twitter_url,
          ),
        ),
      ),
      Expanded(
        child: Container(
          height: MediaQuery.of(context).size.height / 2,
          width: MediaQuery.of(context).size.width,
          child: WebViewExample(
            url: linkedin_url,
          ),
        ),
      ),
      Expanded(
        child: Container(
          height: MediaQuery.of(context).size.height / 4,
          width: MediaQuery.of(context).size.width,
          child: WebViewExample(
            url: twitter_url,
          ),
        ),
      ),
      Expanded(
        child: Container(
          height: MediaQuery.of(context).size.height / 2,
          width: MediaQuery.of(context).size.width,
          child: WebViewExample(
            url: linkedin_url,
          ),
        ),
      ),
    ];
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SafeArea(
        child: Center(
          child: ListView.builder(
            itemBuilder: (context, index) => webViewList[index],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}

class WebViewExample extends StatefulWidget {
  final url;
  WebViewExample({this.url});

  @override
  WebViewExampleState createState() => WebViewExampleState();
}

class WebViewExampleState extends State<WebViewExample> {
  @override
  void initState() {
    super.initState();
    // Enable hybrid composition.
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return WebView(
      javascriptMode: JavascriptMode.unrestricted,
      initialUrl: Uri.dataFromString(
        widget.url,
        mimeType: 'text/html',
        encoding: Encoding.getByName('utf-8'),
      ).toString(),
    );
  }
}

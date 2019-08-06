import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:sumup_flutter/sumup_flutter.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _platformVersion = 'Unknown';

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    String platformVersion;
    // Platform messages may fail, so we use a try/catch PlatformException.
    await SumupFlutter.authenticate("aeb8452f-8e21-4a4d-84ae-7cb3a2a5ba27");
    await SumupFlutter.presentLoginView()


    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _platformVersion = platformVersion;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              RaisedButton(
                onPressed: () => SumupFlutter.presentLoginView(),
                child: Text("Login"),
              ),
              RaisedButton(
                onPressed: () => SumupFlutter.checkout(new SumupCheckoutRequest(amount: "12.0", title: "Test", currencyCode: "EUR")),
                child: Text("Checkout"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

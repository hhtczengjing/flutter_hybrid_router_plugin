import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:flutter_hybrid_router/flutter_hybrid_router.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _platformVersion = 'Unknown';
  String _appVersion = 'Unknown';
  FlutterHybridRouter router = new FlutterHybridRouter();

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    String platformVersion;
    String appVersion;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      Map obj1 = await router.objectForURL(
          url: 'com.devzeng.demo://version?type=:type', parameters: ['1']);
      Map obj2 = await router.objectForURL(
          url: 'com.devzeng.demo://version?type=:type', parameters: ['2']);
      platformVersion = obj1['version'];
      appVersion = obj2['version'] + '(' + obj2['build'] + ')';
    } on PlatformException {
      platformVersion = 'Failed to get platform version.';
      appVersion = 'Failed to get application version.';
    }

    if (!mounted) return;

    setState(() {
      _platformVersion = platformVersion;
      _appVersion = appVersion;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey[100],
        appBar: AppBar(
          title: const Text('Plugin example app'),
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            tooltip: '返回',
            onPressed: () => router.openURL(url: 'com.devzeng.demo://goback')
          ),
        ),
        body: Column(
          children: [
            Text('System version: $_platformVersion\n'),
            Text('Application version: $_appVersion\n'),
          ],
        ),
      ),
    );
  }
}

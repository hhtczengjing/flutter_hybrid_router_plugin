import 'dart:async';

import 'package:flutter/services.dart';

class FlutterHybridRouter {
  static const MethodChannel _channel =
      const MethodChannel('flutter_hybrid_router');

  Future<void> openURL({String url, List parameters}) async {
    _channel.invokeMethod(
        'openURL', {"url": url ?? "", "parameters": (parameters ?? {})});
  }

  Future<Map> objectForURL(
      {String url, List parameters}) async {
    Map result = await _channel.invokeMethod(
        'objectForURL', {"url": url ?? "", "parameters": (parameters ?? {})});
    return result;
  }
}

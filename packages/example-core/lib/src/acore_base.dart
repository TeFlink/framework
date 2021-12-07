import 'dart:convert';

import 'package:teflink_console/console.dart';
import 'package:teflink_core/core.dart';
import 'package:teflink_http/http.dart';
import 'package:shelf/shelf.dart' as shelf;

class ServerApp extends Server {
  ServerApp({required int port, required this.application}) : super(port: port);

  Application application;

  @override
  void entryPoint() {
    addRoute(TeFlinkRoute(
      method: TfMethod.GET,
      path: '/v1/ruta',
      handler: (request) {
        return shelf.Response.ok(json.encode({'hola': 'Mundo'}),
            headers: {'Content-Type': 'application/json'});
      },
    ));

    super.entryPoint();
  }
}

class ControllerDemo {}

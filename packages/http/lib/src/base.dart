import 'dart:async' show Future;
import 'package:shelf/shelf_io.dart' as io;
import 'package:shelf_router/shelf_router.dart';
import 'package:shelf/shelf.dart';

// For Google Cloud Run, set _hostname to '0.0.0.0'.
const _hostname = '0.0.0.0';

class Server {
  Server({int port = 8000}) {
    server = TeFlinkHttp(port: port);
  }

  late TeFlinkHttp server;

  void addRoute(TeFlinkRoute controller) {
    server.addRoute(controller);
  }

  void entryPoint() {
    server.serve();
  }
}

enum TfMethod {
  GET,
  POST,
  PUT,
}

class TeFlinkRoute {
  TeFlinkRoute(
      {required this.path, required this.handler, required this.method});

  final String path;
  final TfMethod method;
  String get verb {
    switch (method) {
      case TfMethod.GET:
        return 'GET';
      case TfMethod.POST:
        return 'POST';
      case TfMethod.PUT:
        return 'PUT';
    }
  }

  final Response Function(dynamic request) handler;
}

class Service {
  // The [Router] can be used to create a handler, which can be used with
  final router = Router();
  // [shelf_io.serve].
  Handler get handler {
    // Handlers can be added with `router.<verb>('<route>', handler)`, the
    // '<route>' may embed URL-parameters, and these may be taken as parameters
    // by the handler (but either all URL parameters or no URL parameters, must
    // be taken parameters by the handler).
    router.get('/say-hi/<name>', (Request request, String name) {
      return Response.ok('hi $name');
    });

    // Embedded URL parameters may also be associated with a regular-expression
    // that the pattern must match.
    router.get('/user/<userId|[0-9]+>', (Request request, String userId) {
      return Response.ok('User has the user-number: $userId');
    });

    // Handlers can be asynchronous (returning `FutureOr` is also allowed).
    router.get('/wave', (Request request) async {
      await Future.delayed(Duration(milliseconds: 100));
      return Response.ok('_o/');
    });

    // Other routers can be mounted...
    router.mount('/api/', Api().router);

    // You can catch all verbs and use a URL-parameter with a regular expression
    // that matches everything to catch app.
    router.all('/<ignored|.*>', (Request request) {
      return Response.notFound('Page not found');
    });

    return router;
  }

  void addControllers(List<TeFlinkRoute> controllers) {
    controllers.forEach((controller) {
      router.add(controller.verb, controller.path, controller.handler);
    });
  }
}

class Api {
  Future<Response> _messages(Request request) async {
    return Response.ok('[]');
  }

  // By exposing a [Router] for an object, it can be mounted in other routers.
  Router get router {
    final router = Router();

    // A handler can have more that one route.
    router.get('/messages', _messages);
    router.get('/messages/', _messages);

    // This nested catch-all, will only catch /api/.* when mounted above.
    // Notice that ordering if annotated handlers and mounts is significant.
    router.all('/<ignored|.*>', (Request request) => Response.notFound('null'));

    return router;
  }
}

class TeFlinkHttp {
  TeFlinkHttp({required this.port});

  int port;
  dynamic handler;
  List<TeFlinkRoute> controllers = [];

  void addRoute(dynamic controller) {
    controllers.add(controller);
  }

  void serve() async {
    final service = Service();
    service.addControllers(controllers);
    var server = await io.serve(service.handler, _hostname, port);
    server.autoCompress = true;
    print('Serving at http://${server.address.host}:${server.port}');
  }
}

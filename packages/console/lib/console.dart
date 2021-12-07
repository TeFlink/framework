// import 'package:enough_ascii_art/enough_ascii_art.dart';
import 'package:ansicolor/ansicolor.dart';
import 'package:teflink_core/core.dart';

void printWithColor(String message) {
  final pen = AnsiPen()
    ..white()
    ..rgb(r: 1.0, g: 0.8, b: 0.2);
  print(pen(message));
}

Future<void> showTitle() async {
  final figure = 'CORE'; // renderFiglet('CORE', Font());
  printWithColor(figure);
  printWithColor('Simple web framework, inspirated on Symfony ❤️');
  print('');
}

class Application {
  Application({required this.dotEnv});
  final DotEnv dotEnv;

  String getVersion() {
    return 'Core 0.0.1 (env: ${dotEnv.get('APP_ENV')}, debug: ${dotEnv.get('APP_DEBUG')})';
  }

  void runServer(List<String> args) {
    // print(args[0]);
    print('Running');
  }
}
